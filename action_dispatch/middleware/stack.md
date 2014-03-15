---
title: ActionDispatch::Middleware::Stack
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/stack.rb)

Rack ミドルウェアを管理するコレクションを提供する MiddlewareStack が実装されている。
ミドルウェアを途中に挿入したりする機能を備えてるように見える。

[Rack::Builder](https://github.com/rack/rack/blob/371cf6f3a8d390edfa901b6f963b78810270a387/lib/rack/builder.rb) の代わりに使うものなのだろうか。
