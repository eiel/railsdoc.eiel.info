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

キャッシュ機能を提供すモジュール。

実際には ActiveSuport::Cache::Store の継承クラスによってキャッシュの管理が行なわれる。
使うクラスによってキャッシュの保存先を変えられる。
Store の種類には以下のものがあります。

* FileStore
* MemoryStore
* MemCacheStore
* NullStore

などなどあります。

cache を作成して、キャッシュがなければ、`read` は `nil` を返します。
キャッシュに書き込みする場合は `write` を使います。

```ruby
require 'active_support/cache'
cache = ActiveSupport::Cache::MemoryStore.new

cache.read('country')            # => nil
cache.write('country', 'Japan')
cache.read('country')            # => 'Japan'
```

`FaileStore` を利用した場合は、プロセスを終了してもキャッシュが残ります。

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

ActiveSupport::Cache::Store
--------------------------------------------------------------------------------

抽象クラスなので継承して使います。

### #silence!

サイレンスモードをオンにする。

### #mute

このメソッドにブロックで渡した部分はサイレンスモードで実行されます。

### .instrument

true のとき、通知を発生させるようになります。
デフォルトは false

### #fetch

* fetch(name, options = nil)

`name` をキーにキャッシュをを取り出します。
ブロックを渡した場合、キャッシュがなければその値をキャッシュします。
ブロックがない場合は `read` メソッドと同じです。

`options` には `:namespace, :compress, :compress_threshold, :expires_in, :race_condition_ttl` が使用できます。

### #read

* read(name, options = nil)

`name` をキーにしたキャッシュに保存された値を取り出します。
キャッシュにヒットしたかどうかを通知する際に情報を付加します。
`cache_read.active_suppor`という通知が発生します。
通知の`payload` に`:hit` というエントリが追加され `true` か `false` を返します。


### #read_multi

* read_multi(*names)

複数のキーをまとめてキャッシュから取り出し、ハッシュで値を返します。
通知は発生しない。

### fetch_multi

* fetch_multi(*names)

複数のキーをまとめてキャッシュから取り出し、ハッシュで値を返します。
値が見付からない場合は渡したブロックを実行して戻り値をキャッシュします。
ブロックには key が渡され、キーごと処理を変えることができます。

### #write

* write(name, value, options = nil)

name をキーに value をキャッシュとして保存します。
`cache_write.active_suppor`という通知が発生します。

### #delete

* delete(name, options = nil)

`name` をキーとしたキャッシュを削除します。
`cache_delete.active_suppor`という通知が発生します。

### exist?

* exist?(name, options = nil)

`name` をキーとしたキャッスが存在するか確認します。
`cache_exist?.active_suppor`という通知が発生します。

### delete_matched

* delete_matched(matcher, options = nil)

マッチするエントリーをすべて削除する。サブクラスでオーバーライドする。

### increment

* increment(name, amount = 1, options = nil)

エントリーの値をインクリメントする。


### #merged_options

* merged_options(call_options)

コンストラクタで設定されたオプションと各メソッドで渡されたオプションをマージした結果を返します。コピーされたものを返すので、利用する側は自由に書き換えられます。

オプションには `:namespace, :compress, :compress_threshold, :expires_in, :race_condition_ttl` が使用できます。

expires_in はオプションのキャッシュ有効期限を設定します。

namespace はキャッシュのキーにprefix をつけて切り換えることができます。
ブロックを渡しておくと、必要な時に実行してnamespaceを切り替えることができます。
