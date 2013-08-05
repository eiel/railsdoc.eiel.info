---
title: ActiveSupport::Dependencies
---


試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

`active_support` で Autoload されています。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/dependencies.rb)

ファイル内で追加定義されてるクラス/モジュール

* ActiveSupport::Dependencies::WatchStack
* ActiveSupport::Dependencies::ModuleConstMissing
* ActiveSupport::Dependencies::Loadable
* ActiveSupport::Dependencies::ClassCache

このファイルの読み込みの最後に`ActiveSupport::Dependencies.hook!`が実行されている。

これによって未設定の定数をみつけた時に `ActiveSupport::Dependencies.autoload_paths` に登録したディレクトリから規約に沿ったファイルを自動的に読み込みます。

例

カレントディレクトに `hoge.rb` というファイルを用意して中身は

```ruby
class Hoge
  def hoge
    "hogehoge"
  end
end
```

とします。

下記のコードを irb などで実行できます。

```ruby
require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << "."

Hoge.new.hoge  # => "hogehoge"
```

ActiveSupport::Dependencies
--------------------------------------------------------------------------------

`extend self` されているので実質モジュールメソッドのように使うことになる。

### #hook!

言わばエントリポイント。
このメソッド呼ぶと自動読み込み機能が有効になる。

### #unhook!

`hook!` を解除する。

### #load?

読み込みモードが `load` かどうかを返す。
他の読み込みモードには `require` がある。

### #depend_on

* depend_on(file_name, message = "No such file to load -- %s.rb")

`file_name` を読みこみ、失敗したらエラーに情報を付加する。

### #clear

`loaded` を初期化して、自動読み込みしていた定数を削除する

### #require_or_load

* require_or_load(file_name, const_path = nil)

すでに読み込みしてる場合はなにもしない。
読み込みしたかどうかは モジュール変数`loaded` に保存されている
モジュール変数mechnize が :load であれば `load` して、そうでない場合 `require` する。
はじめてloadする場合は警告が出力されるモードになる。

### #qualified_const_defined?

* qualified_const_defined?(path)

定数path が定義されてるかどうか確認する。
`::Hoge::Mogu` を確認したい場合に先頭の `::` を削除して Object.qualified_const_defined? に問い合わせてしている。

### #loadable_constants_for_path

* loadable_constants_for_path(path, bases = autoload_paths)

引数bases から定数パス を構築しリストで返す。
ファイルが見つからなければ空のリストを返す。

例:

```
$ tree hoge
hoge
├── goro
│   └── hoge.rb
└── mogu
```

```ruby
require 'active_support/dependencies'
ActiveSupport::Dependencies.loadable_constants_for_path('hoge/goro/hoge',['.'])  # => [Hoge::Goro::Hoge]
```

### #search_for_file

* search_for_file(path_suffix)

`ActiveSupport::Dependencies.autoload_paths` から 引数path_suffix に該当するファイルを探す。
`.rb` はあってもなくても補完されます。みつからない場合は nil を返す。

例:

```
$ tree hoge
hoge
└── hoge.rb
```

```ruby
require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << "."

ActiveSupport::Dependencies.search_for_file("hoge.rb")      # => nil
ActiveSupport::Dependencies.search_for_file("hoge/hoge.rb") # => "./hoge/hoge.rb"
ActiveSupport::Dependencies.search_for_file("hoge/hoge")    # => "./hoge/hoge.rb"
```

### #autoloadable_module?

* autoloadable_module?(path_suffix)

引数`path_suffix` が`ActiveSupport::Dependencies.autload_paths`内にあるディレクトリか確認します。
モジュールのためのディレクトがあるか確認できます。
みつかった場合の戻り値は `autoload_paths` の要素になります。

```ruby
require 'active_support/dependencies'

ActiveSupport::Dependencies.autoload_paths << "."
ActiveSupport::Dependencies.autoloadable_module? "hoge/mogu"  # => "."
```

### #load_once_path?

* load_once_path?(path)

引数path が `ActiveSupport::Dependencies.autoload_once_pahs` に該当するものかどうか確認します。

### #autoload_module!

* autoload_module!(into, const_name, qualified_name, path_suffix)

引数qualified_name を定義するために 引数into モジュール に 引数const_name を定義します。
引数path_suffix は実際のパスに対応します。

`Hoge::Mogu` を読み込みするのに `Hoge` を提供する`hoge.rb`がなくても読み込めるのもの言えそう。

読み込みしたものは autoloaded_constantns に記録。

### #load_file

* load_file(path, const_paths = loadable_constants_for_path(path))

引数path 読み込みします。
引数const_paths から基準にするモジュールを探します。

### #qualified_name_for

* qualified_name_for(mod, name)

引数mod 親としたときの 引数name のフルネームを返します。
トップレベルの場合 mod が Object になるので、これが表示されないようになっています。

``ruby
require 'active_support/dependencies'

Hoge = Module.new

ActiveSupport::Dependencies.qualified_name_for Object, "Mogu" # => "Mogu"
ActiveSupport::Dependencies.qualified_name_for Hoge, "Mogu" # => "Hoge::Mogu"
```

### #load_missing_constant

* load_missing_constant(from_mod, const_name)

定数の読み込みに失敗した時に自動読み込みを試みます。
引数 from_mod に 引数const_name を読み込もうと試みます。
このモジュールのコアと言えそう。

* 読み込みがループしているようなら例外が飛ぶようになってる
* 該当するファイルがみつからなくても `Hoge::Mogu` のHogeのような名前空間のためのものであればなんとかするようになってる
* ファイルを読み込みしても該当する定数が定義されてなければ例外が発生する

### #remove_unloadable_constants!

自動で読み込みしたものをすべて破棄します。

下記のような `./hoge/mogu/goro.rb` を用意して

```ruby
module Hoge::Mogu
  class Goro
  end
end

puts 'gorogoro'
```

以下を実行したら、`RuntimeError: Circular dependency detected while autoloading constant Hoge::Mogu::Goro` が発生した。

```ruby
require 'active_support/dependencies'

ActiveSupport::Dependencies.autoload_paths << "."
Hoge::Mogu::Goro
# outpus "gorogoro"
ActiveSupport::Dependencies.remove_unloadable_constants!
Hoge::Mogu::Goro
```

バグなのか調査したい。

### #log_call

* log_call(*args)

`ActiveSupport::Dependencies` の log が有効であれば、

`called 呼び出し元 引数をカンマでjoinしたもの`

が出力されます。ログレベルは debug になります。

### #log

* log(msg)

`ActiveSupport::Dependencies` の log が有効であれば、引数msg をログレベル debug で出力します。
頭に`Dependencies: ` が付与されます。

### #log_activity?

`logger` にインスタンスが設定されており、`log_activity` が true であれば、有効状態になります。

```ruby
require 'active_support/dependencies'
require 'logger'

ActiveSupport::Dependencies.logger = Logger.new(STDOUT)
ActiveSupport::Dependencies.log_activity = true

# log メソッドが protected なので include した
include ActiveSupport::Dependencies
log 'hoge'
```

出力

```
D, [2013-07-31T11:57:59.350313 #23340] DEBUG -- : Dependencies: hoge
```

### #reference

* reference(klass)

引数klass を記録する

### #constanize

* constantize(name)

引数name から `reference`メソッドで記録したクラスを取得する。

### #safe_constatize

* safe_constantize(name)

引数Name に該当する定数がなくても例外が起きないバージョン

### #autolloaded?

* autoloaded?(desc)

引数desc がオートロードされたものか確認する。

### #wiss_unload?

* will_unload?(const_desc)

引数const_desc がロードされない定数の名前か確認する

### #mark_for_unload

* mark_for_unload(const_desc)

引数const_desc を読み込みしない定数の名前として登録する

### #new_constants_in

* new_constants_in(*descs)

このメソッドブロックで読み込みをすることで新しく追加された定数を認識することだげきる。

### #to_constant_name

* to_constant_name(desc)

引数desc を定数の名前に変換する

頭に ::`` ついている場合は取り除いたりする。

### #remove_constant

* remove_constant(const)

引数const を取り除く。

ActiveSupport::Dependencies::WatchStack
--------------------------------------------------------------------------------

ActiveSupport::Dependencies が constant_watch_stack を保持するのに利用するクラス。

名前空間を監視して、新しく追加された定数を発見できる。
`watch_namespaces` を使って監視する名前空間を指定できます。
監視中に `new_contants` を呼び出すと監視が終了し、新しく発見した定数を返します。

```ruby
require 'active_support/dependencies'

watch_stack = ActiveSupport::Dependencies::WatchStack.new

watch_stack.watch_namespaces ["Object"]

module Goro1
  module Hoge1
  end
end

watch_stack.new_constants # => [Goro1]

watch_stack.watch_namespaces ["Object", "Goro2"]

module Goro2
  module Hoge2
  end
end

watch_stack.new_constants # => ["Goro2", "Goro2::Hoge2"]
```

### #each

watch_namespaces を呼ぶたびに監視する名前空間をスタックします。これを each できます。

### #watching?

監視しているものがあるかどうかを問合せます。

### new_constants

最後に watch_namespaces したものを監視を終了して、新しく見つけた定数のリストを返します。

### watch_namespaces

* watch_namespaces(namespaces)

引数 namespaces を監視します。定数の名前のリストを渡します。
定数のリストを渡しても動きますが、未作成の定数の場合はエラーが起きるので文字列を使うほうが良さそうです。

ActiveSupport::Dependencies::ModuleConstMissing
--------------------------------------------------------------------------------

`Module` クラスにインクルードされるモジュール。定数がみつからない場合の処理を追加します。`const_missing` メソッドが呼ばれるようになります。

### .append_features

* append_features(base)

このモジュールを include したときに呼ばれるメソッド。

`const_missing`メソッドを `@_const_missing` に保存して、メソッドを削除している。
[const_missing](http://doc.ruby-lang.org/ja/1.8.7/method/Module/i/const_missing.html) は定義されていない定数を参照した時に呼ばれるメソッドです。

### .exclude_from

* exclude_from(base)

`.append_feartures` の逆の動作をするメソッド。 `@_const_missing` から `const_missing`メソッドを戻します。
`ActiveSupport::Dependencies`の効果を止める `unhook!` で呼ばれています。

### #const_missing

* const_missing(const_name)

引数 `constname` をトップレベルのモジュールかどうか判断して、トップレベルなら `::Qbject` を `from_mod` にして `load_missing_constant` を呼びだす。

### unloadble

FIXME

`ActiveSupport::Dependencies::Unlodable#unloadble` へのためのものと推測されるけどよくわからない。
super に委譲するだけ。


ActiveSupport::Dependencies::Loadable
--------------------------------------------------------------------------------

Object に `include` されるモジュール。
`Kernel#load` や `Kernel#require` の機能を拡張します。

### .exclude_from

`unhook!` した際に呼ばれる。

`Kernel#load` のメソッドをとってきて `load` に上書きする。

### #requre_or_load

* require_or_load(file_name)

`Dependencies.require_or_load` に丸投げ。

### #require_dependency

* require_dependency(file_name, message = "No such file to load -- %s")

fise_name が文字列かどうかチェックして、文字列であれば、`Dependencies.depend_on`に丸投げします。


### #load_dependency

reload をするモードで、`Activesupport::Dependency::WatchStack の 定数の監視中であれば、`Activesupport::Dependency.new_constants_in` を利用して、そうでない場合は 普通に `load` または `require` を実行します。

### #load

`Kernel#load` を上書きして、 load_dependecy を使いloadするようにする。

### #require

`Kernel#require` を上書きして、 load_dependecy を使いrequireするようにする。

ActiveSupport::Dependecy::Blamable
--------------------------------------------------------------------------------

Exception クラスに include されるモジュール。
読み込みに失敗したファイルを記録できるようにする。

### #blame_file!

* blame_file!(file)

file を読み込みに失敗したファイルとして登録。

### #blamed_files

読み込みに失敗したファイルの一覧を取得。

### #describe_blame

読み込みに失敗したファイルの詳細を示す。

### #copy_blame!

* copy_blame!(exc)

別の例外から読み込みに失敗したファイルの情報をコピーする。

ActiveSupport::Dependencies::ClassCache
--------------------------------------------------------------------------------
スレッドセーフなキャッシュのラッパー。get や safe_get でキャッシュにある定数を取得。store で保存 clear! で削除する。

### #initialize

`ThreadSafe::Cache` のインスタンスを内部に持ちます。

### #empy?

キャッシュが空かどうか確認する

### #key?

* key?(key)

引数key がキャッシュにあるか確認する

### #get

* get(key)

引数key に該当するクラスを返します。

### safe_get

* sefe_get?(key)

安全に 引数key に該当するクラスを返します。
例外が飛ばない。

### #store(

* store(class)

キャッシュに 引数 class を登録します。

### #clear!

キャッシュを破棄します。
