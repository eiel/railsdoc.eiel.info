---
title: Rails::Generators::Erb::Controller::ControllerGEnerator
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/erb/controller/controller_generator.rb)

`rails g erb:controller` の中身。第1引数に指定した名前のがコントローラでそれ以降をアクションど判断されて、Viewファイルを作成します。
