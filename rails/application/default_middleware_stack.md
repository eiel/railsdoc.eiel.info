---
title: Rails::Application::DefaultMiddlewareStack
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/application/default_middleware_stack.rb)

文字どおりデフォルトのミドルウェアスタックを構築する。

`build_stack` メソッドによって構築できる。

全部のミドルウェアが積まれた場合は

1. ActionDispatch::SSL
1. Rack::Sendfile
1. ActionDispatch::Static
1. Rack::Cache
1. Rack::Lock
1. Rack::Runtim
1. Rack::MethodOverride
1. ActionDispatch::RequestId
1. Rails::Rack::Logger
1. ActionDispatch::ShowExceptions
1. ActionDispatch::DebugExceptions
1. ActionDispatch::RemoteIp
1. ActionDispatch::Reloader
1. ActionDispatch::Callbacks
1. ActionDispatch::Cookies
1. ActionDispatch::Flash
1. ActionDispatch::ParamsParser
1. Rack::Head
1. Rack::ConditionalGet
1. Rack::ETag

が積まれる模様。
