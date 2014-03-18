---
title: ActionDispatch::Middleware::Session::CacheStore
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/session/cache_store.rb)

[AbstractStore](abstract_store) を継承したStore の一つ。
重要ではない消えても大丈夫な情報を保存するのに使うみたい。

Rails.cache に設定されているキャッシュ機能を使う。
