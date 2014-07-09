---
title: Rails::Application::Bootstrap
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/application/bootstrap.rb)

Rails::Application#initializers で利用される。
初期化処理の取得のひとつという扱いの模様

1. load_environment_hook
1. load_active_support
1. set_eager_load
1. initialize_logger
1. initialize_cache
1. initialize_dependency_mechanism
1. bootstrap_hook

という初期化処理が存在する。
必要があれば、initializer の option で before や after を使い、処理の挿入ができるのではないかと思う。
実際 load_environment_hook はなにもしてない。

### load_active_support

config.active_support.bare が false の場合 active_support/all を読み込みする
true にしておくと、読みこまないことができるということっぽい。

### set_eager_load

config.eager_load が nil の場合、警告が表示されます。
config.cache_classe の値を代入します。

### initialize_logger

logger の設定をする。config.paths["log"]の値でログの出力場所が変更できる。


### initialize_cache

Rails.cache の設定が未設定の場合に Rails.cache の設定を行う。
Rails.cache が middleware を返すものであれば、Rack::Runtime ミドルウェアの前に挿入する。

### initialize_dependency_mechanism

ActiveSupport::Dependencies.mechanism の設定を行う。
config.cache_classes の値が true なら :require を利用し、そうでない場合は :load になる。

### bootstrap_hook

before_initialize という通知を発生させる。
