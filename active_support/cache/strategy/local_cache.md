---
title: ActiveSupport::Cache::Strategy::LocalCache
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

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/cache/strategy/local_cache.rb)

キャッシュのストアに機能を追加できる Middleware と ローカルにキャッシュする LocalCache が定義されています。

`@data` にもキャッシュデータを一時的に保存しておけるようです。(ちゃんと確認はしてない)


ActiveSupport::Cache::Strategy::LocalCache::LocalCacheRegistry
--------------------------------------------------------------------------------

[ActiveSupport::PerThreadRegistry](/active_support/per_thread_registry) の利用に使うクラスです。

ActiveSupport::Cache::Strategy::LocalCache::LocalStore
--------------------------------------------------------------------------------

インスタンス変数にキャッシュを保存するストアです。

ActiveSupport::Cache::Strategy::LocalCache
--------------------------------------------------------------------------------

### #with_local_cache

このメソッドのブロック内では LocalStore が利用されます。

### middleware

デフォルトのミドルウェアを取得します。

### clear

キャッシュを削除します。

### clenup

キャッシュを削除します。

### increment

キャッシュの値を増加させます。

### decrement

キャッシュの値を現象させます。

ActiveSupport::Cache::Strategy::LocalCache::Middleware
--------------------------------------------------------------------------------

### #initialize

* initialize(name, local_cache_key)

引数 name になまえを渡しますが、便宜的なもののようです。
LocalStoreを使うMidleware を作成します。

### new

* new(app)

引数 app を Middleware で包みます。
