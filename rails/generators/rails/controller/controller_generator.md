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

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta2/railties/lib/rails/generators/rails/controller/controller_generator.rb)

`rails g controller` の中身。引数はコントローラ名が続き、アクションを複数個並べられる。
routing もアクションに応じて自動で追加される。

一緒にビューやヘルパーが生成される。
