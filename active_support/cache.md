---
title: ActiveSupport::Cache
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

キャッシュ機能を提供するクラス。
キャッシュの保存先をいろいろ指定できるみたい。

* FileStore
* MemoryStore
* MemCacheStore
* NullStore

などなどある。

ActiveSupport::Cache
--------------------------------------------------------------------------------

### .lookup_store

* lookup_store(*store_option)

利用するキャッシュストアを指定すると必要なクラスを読み込みして new したものを返してくれる模様。

第1引数には `:memory_store` といったシンボルを渡し、第2引数以降は new するときの引数として利用される。

### .expand_cache_key

* expand_cache_key(key, namespace = nil)

`:namespace/:app_id/:key1/:key2` のようなキャッシュキーを生成する。
引数 namespace が先頭にやってきて、`:app_id` には、ENV["RAILS_CACHE_ID"] または ENV["RAILS_APP_VERSION"] の値が利用される。

引数key にはリストやオブジェクトも渡せる。`cache_key` というメソッドがあれば、これを使い変換する。配列のばあいは再帰的によびだす。そうでない場合は to_param で変換します。
