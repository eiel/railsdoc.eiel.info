---
title: Rails::Generators
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/generators.rb)

Generator のための得意メソッドが実装されている。
generate コマンドはもちろん、destroy コマンドにも利用される。

Rails::Generators
---

### .namespace

### DEFAULT_ALIASES

デフォルトのエイリアスが登録されている。
namespace ごとに Hash になっている。

### DEFAULT_OPTIONS

デフォルトのオプションが登録されている。
namespace ごとに Hash になっている

### .configure

* configure(config)

config をうけとって設定を行う。

config.colorize_logging が `false` であれば色が付かないようになる。

config.alias に追加のエイリアスが登録できる。

config.options に追加のオプションを登録できる。

config.fallback に追加の fallback を登録できる。

config.templates に追加のテンプレートパスを追加できる

config.hidden_namespaces に隠すネームスペースを追加できる。

### .templates_path

テンプレートパスを格納する。デフォルトは空

### .aliases

設定されているエイリアスを返す。

### .options

設定されているオプションを返す。

### .fallbacks

フォールバックを返す。
フォールバックは別ネームスペースと連携する際の情報が入る模様。

shoulda は test_unit を使うので { shoulda: :test_unit } のような項目が追加される。

### .no_color!

色が付かないようにする。
バックエンドに利用されている Thor::Base.shell の設定を行う。

### .subclasses

Generator のサブクラスを記録する。

### .find_by_namespace

* .find_by_namespace(name, base=nil, context=nil)

引数 name のネームスペースを探す

:を含まない場合は

* "#{name}:#{name}"
* "rails:#{name}"

も検索対象に。

baseを指定すれば

* "#{base}:#{name}"

context を指定すれば

* "#{name}:#{context}"

を探す。

### .invoke_fallbacks_for

* invoke_fallbacks_for(name, base)

フォールバックを実行する。
引数 base のフォールバックを取得して実行する。

### .invoke

* invoke(namespace, args=ARGV, config={})

実行するクラスを決めて `.start` メソッドを呼ぶ。

### .hidden_namespace

隠されるネームスペースの一覧を返す。

### .hide_namespaces

隠されるネームスペースを追加する。

### .help

ヘルプを出力する。
追加されているジェネレータも表示する。

### .print_list

* print_list(base, namespaces)

base をグループの見出しに namespaces を出力する。

### .lookup!

読み込めるジェネレータを読み込みする。

### .lookup

`namespace_to_path` で変換したパスを

* {rails/generator/#{path}}
* {generator/#{path}}

で require する。

### .namespace_to_paths

* namespaces_to_paths(namespaces)

ネームスペースをパスにする。

"rails:model" であれば

* "rails/model/model_generator"
* "rails/model_generator"

を探す。
