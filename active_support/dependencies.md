---
title: ActiveSupport::Dependencies
---


試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc1
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

TODO

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

TODO
