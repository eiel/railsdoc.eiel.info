---
title: ActiveSupport::Cache::MemCachStore
---

試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

キャッシュ機能を提供し保存方法を決定する [ActiveSupport::Cach::Store](/active_support/cache) の具象クラスのひとつです。

保存先に Memcached を使用します。
利用には dalli ge を使用します。

コンストラクタの引数は任意ですが、アクセスす Memcached を指定します。
デフォルトでは `localhost:11211` にアクセスします。
