---
title: ActionDispatch::HTTP::Headers
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/headers.rb)

[ActionDispatch::HTTP::Response](/action_dispatch/http/response)#headers の戻り値の型である、Headers が定義されている。

Enumerable で Hash のように扱えるようになっている。
CGI_VARIABLES でないものは、`HTTP_` という接頭辞を加えて Rack の env にアクセスする。
each したときにはこのルールが適用されてない点が気になる。
