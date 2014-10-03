---
title: Rails::Generators::AppGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta2/railties/lib/rails/generators/rails/app/app_generator.rb)


Railsのベースを生成するジェネレータ。
`rails new` した時に呼ばれるもの。

Rails::AppBuilderを置き換えると挙動が変えられるようになっている模様。

`get_builder_class`メソッドを上書きすれば、変更できる。

Rails::ActionMethods
---

generatorに一部の処理を以上するためのメソッドを定義しているモジュール

Rails::AppBuilder
---

Railsのベースとなるファイルを作る部分だけ抽出したもの、testディレクトリなどをつくったりするため、このあたりを変更したいのであればオーバーライドして、処理を変更する必要があります。

ここに定義されているメソッドはGenerator側でbuildメソッドを経由して呼び出します。
