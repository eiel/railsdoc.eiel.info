---
title: Rails::Generator::Base
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/base.rb)

[Thor::Group](/thor/group)を継承して Generator の基底クラスとなるのがこのクラスになります。

Thor::Groupのメソッドがいくつか改良されていて、desc が USAGE ファイルの内容を使ったりなどがあります。

余った引数は利用されない。
force pretend quiet skip というオプションは自然に追加される。

::Generators::Error
---

Thor::Error を継承してるエラーを示すクラス

Rails::Generator::Base
---

### .source_root

source_rootを設定できる。デフォルトは defoult_source_root になる。x

### .desc

usage_path にファイルがあればそれを使う。
ない場合はGenerator のファイルをつくる旨の文章になる。

### .namespace

_generatorや :generators: を取り除いた値になる。
コードを読む際には知らないと困りそう。


### .hide!

Rails::Generators.hide_namespace に 自分自身を加えることで非表示にする。

### .hook_for

一緒に呼び出すジェレネータを設定でき、オプションなども自動追加される。
名前から自動的に base_name や generator_name が決まるが、 in で base_name as で generator_name を明示的に設定できる。

### .remove_hook_for

hook_for で登録したものを削除できる。

### .class_option

* class_option(name, options={})

desc, aliases defaultを 引数nameから自動生成してオプションを設定する。

### .default_source_root

default_generator_root 内の templates ディレクトリのパスを返す。

### .base_root

各pathのベースになるディレクトリを返す。

デフォルトでは、このファイルのあるディレクトリを返す。
継承していても同じ値を返す。

rails本体内のGenerator が多いからこういう仕様になっているのでないかと思うわれる。

### .inherited

このクラスを継承した際の処理。

ails::Generators.subclasses に追加して、source_paths を自動設定します。x

### .class_collisions

* class_collisions(*class_names)

ユーザの定義したクラスを衝突しないかチェックする。

### .extract_last_module

* extract_last_module(nesting)

nestingに含まれている最後の定数を取得する。

### .banner

generator のデフォルトのバナーをつくる。

rails generate ... みたいな感じ。

### .base_name

ベースネームを作る。

名前空間の先頭をアンダースコア化したもの。

### .generator_name

名前空間を外した名前に Generator を削除してアンダースコア化したもの。

### .default_value_for_option

* default_value_for_option(name, options)

引数nameのデフォルト値を取り出す。

### .default_aliases_for_option

* default_aliases_for_option(name, options)

与えられた名前のエイリアスを探す。

### .default_for_option

* default_for_option(config, name, options, default)

config から name のための値を取り出す。

### .hooks

このジェネレータのフックの一覧を返す。

### .prepare_for_invocation

どんなクラスが invoke されるのか確認をする。

### .add_shebang_option!

ruby に追加オプションできる機能 -r を提供する機能を追加する。

### .usage_path

説明として使われる USAGE ファイルを探す。
source_root の上のディレクトリか default_generator_root の中から探す。

### .default_generator_root

default の generate_rootを返す。 base_root に base_name , generator_name を連結したところになる。

"/rails/generators/#{base_name}/#{generator_name}"となる。
