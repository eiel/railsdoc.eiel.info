---
title: ActionController::Middleware
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/actionpack/lib/action_controller/middleware.rb)

ActionController::Metal なクラスをRackミドルウェアとして使うためのクラスっぽい。
