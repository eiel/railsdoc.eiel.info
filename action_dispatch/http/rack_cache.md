---
title: ActionDispatch::HTTP::RackCache
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/rack_cache.rb)

Rack::Cache::MetaStore や Rack::Cache::EntityStore を使うための RailsMetaStore や RailsEntityStore が定義されている。
ほとんど [ActiveSupport::Cach](active_support/cache) に委譲する方法をとっている。
MetaStore は Request に対するCache で EntityStore は Response の Body のたのもののようなだけどしっかりとはチェックしてない。
