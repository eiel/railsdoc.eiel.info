---
title: Rails::Configuration
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/configuration.rb)

Rails.application.config に設定される値に使われるクラス。

* MiddlewareStackProxy - Rails.application.config.app_middleware
* Generators - Rails.application.config.app_generators

が定義されている。


Rails::Configuration::MiddlewareStackProxy
---

ミドルウェアスタックへの操作を記録しておくことができるみたいだ。
`Rails::Engine#app` したときにこの操作を実行する。

`merge_info` メソッドによって操作される。
その他のメソッドは操作を登録するメソッドになる。


Rails::Configuration::Generators
---

ジェネレータの情報を格納できるクラス。

