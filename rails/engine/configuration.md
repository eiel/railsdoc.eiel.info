---
title: Rails::Engine::Configuration
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/engine/configuration.rb)

Rails::Engine の設定項目。
[Rails::Railtie::Configuration](/rails/railtie/configuration) を継承している。

Rails::Engine::Configuration
---

### root

読取専用。コンストラクタで初期化する。

Engine のルートパスがはいっている。

### middleware

[Rails::Configuration::MiddlewareStackProxy](/rails/configuration) のインスタンスがはいっている。

### eager_load_paths

`Engine#eager_load!` でまとめてよむパスの一覧がはいっている?

* `app`
* `app/controllers`
* `app/helpers`
* `app/models`
* `app/mailers`
* `app/controllers/concerns`
* `app/models/concerns`

eager_load がよくわかってない。

Rails::Application になるとまた変わる。

### autoload_once_paths

一度だけ autoload する path がはいっている。

デフォでは空っぽいけど。

### autoload_paths

autoload する path がはいっている。

### generators

`Rails::Raitie::Configuration#app_generators` をひきつぐ。
やることも同じ。

### paths

`Rails::Paths::Root` のインスタンスを保持している。
