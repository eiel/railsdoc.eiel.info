---
title: ActionController::ConditinoalGet
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionpack/lib/action_controller/metal/cookies.rb)

Request オブジェクトがもっている cookie_jar メソッドヘ委譲する。
view でも利用できるっぽい。
具体的には [action_dispatch/middleware/cookies](action_dispatch/middleware/cookies) あたりに実装されてるメソッド。
