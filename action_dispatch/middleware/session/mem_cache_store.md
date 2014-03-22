---
title: ActionDispatch::Middleware::Session::MemCacheStore
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/session/mem_cache_store.rb)

[AbstractStore](abstract_store) を継承したStore の一つ。
正確には違うけど、AbstractStore が`Compatibility` `StaleSessionCheck` `SessionObject` に分けてあるのは同じようなものに簡単にできるするためのようです。

実際には`Rack::Session::Dalli` を継承していて、互換となるようにしている。
