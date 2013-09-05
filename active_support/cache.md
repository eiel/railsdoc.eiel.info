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

キャッシュ機能を提供するモジュール。

実際には ActiveSuport::Cache::Store の継承クラスによってキャッシュの管理が行なわれる。
使うクラスによってキャッシュの保存先を変えられる。
Store の種類には以下のものがあります。

* [FileStore](/active_support/cache/file_store)
* [MemoryStore](/active_support/cache/memory_store)
* [MemCacheStore](/active_support/cache/mem_cache_store) - Memcached を使用する
* [NullStore](/active_support/cache/null_store)

などなどあります。

また Middleware もあり機能強化もできるようです。

* [Strategy::LocalCache](/active_support/cache/strategylocal_cache)

この LocalCach は現状すべての Store に利用されているようです。

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
`.instrument`が`true` であれば、`cache_read.active_suppor`という通知が発生します。
通知の`payload` に`:hit` というエントリが追加され `true` か `false` を返します。


### #read_multi

* read_multi(*names)

複数のキーをまとめてキャッシュから取り出し、ハッシュで値を返します。
通知は発生しない。

### #fetch_multi

* fetch_multi(*names)

複数のキーをまとめてキャッシュから取り出し、ハッシュで値を返します。
値が見付からない場合は渡したブロックを実行して戻り値をキャッシュします。
ブロックには key が渡され、キーごと処理を変えることができます。

### #write

* write(name, value, options = nil)

name をキーに value をキャッシュとして保存します。
`.instrument`が`true` であれば、`cache_write.active_suppor`という通知が発生します。

### #delete

* delete(name, options = nil)

`name` をキーとしたキャッシュを削除します。
`.instrument`が`true` であれば、`cache_delete.active_suppor`という通知が発生します。

### #exist?

* exist?(name, options = nil)

`name` をキーとしたキャッスが存在するか確認します。
`.instrument`が`true` であれば、`cache_exist?.active_suppor`という通知が発生します。

### #delete_matched

* delete_matched(matcher, options = nil)

マッチするエントリーをすべて削除する。
サブクラスでオーバーライドされることを期待している。
オーバライドされてない場合はその Store ではサポートされません。

### #increment

* increment(name, amount = 1, options = nil)

エントリーの値を増加させる。
サブクラスでオーバーライドされることを期待している。
オーバライドされてない場合はその Store ではサポートされません。

### #decrement

* decrement(name, amount = 1, options = nil)

エントリーの値を現象させる。
サブクラスでオーバーライドされることを期待している。
オーバライドされてない場合はその Store ではサポートされません。

### cleanup

* cleanup(options = nil)

無効になっているキャシュを破棄する。
サブクラスでオーバーライドされることを期待している。
オーバライドされてない場合はその Store ではサポートされません。

### clear

* clear(options = nil)

キャッシュを破棄する。
サブクラスでオーバーライドされることを期待している。
オーバライドされてない場合はその Store ではサポートされません。

### key_matcher

* key_matcher(pattern, options)

protected メソッド。
引数パターンを namespace オプションに対応できるように再作成する。

### read_entry

* read_entry(key, options)

protected メソッド。
サブクラスで実装する必要のあるメソッド。
引数 key に対応した情報を取り出す。


### write_entry

* write_entry(key, entry, options)

protected メソッド。
サブクラスで実装する必要のあるメソッド。
引数 key に情報を保存する。

### #merged_options

* merged_options(call_options)

privateメソッド。
コンストラクタで設定されたオプションと各メソッドで渡されたオプションをマージした結果を返します。コピーされたものを返すので、利用する側は自由に書き換えられます。

オプションには `:namespace, :compress, :compress_threshold, :expires_in, :race_condition_ttl` が使用できます。

expires_in はオプションのキャッシュ有効期限を設定します。

namespace はキャッシュのキーにprefix をつけて切り換えることができます。
ブロックを渡しておくと、必要な時に実行してnamespaceを切り替えることができます。

### expanded_key

* expanded_key(key)

private メソッド。
引数key をパラメータ化する。
cache_key というメソッドがあればこの値を返す。


### namespaced_key

* namespaced_key(key, options)

オプション namespace を反映した key へと変換する。

### instrument

* instrument(operation, key, options = nil)

通知を作成する。
引数operatoion に応じた通知が発生します。
key はpayloadに追加され 通知先に伝搬されます。

### log

* log(operation, key, options = nil)

ログを出力する。
operation 応じた情報を付与する。

### find_cached_entry

* find_cached_entry(key, name, options)

fetch を利用した場合の read 処理を行う。

### handle_expired_entry

* handle_expired_entry(entry, key, options)

期限の切れたエントリを処理する。
オプションrace_condition_ttl が設定している場合、再エントリされる。
そうでない場合は破棄されてしまう。

### get_entry_value

* get_entry_value(entry, name, options)

fetch で利用される。
fetch_hit という通知を発生する。

### save_block_result_to_cache

* save_block_result_to_cache(name, options)

fetch で利用される。
キャッシュがヒットしなかった場合に値が保存するものがあれば実行される。

ActiveSupport::Cache::Entry
--------------------------------------------------------------------------------

キャッシュのエントリを表現するクラス。値と有効期間の情報を持つ。有効期間は `race_condition_ttl` オプションで利用されます。

### DEFAULT_COMPRESS_LIMIT

このサイズより大きい値は圧縮をする。
デフォルトは16キロバイト。
`compress_threshold` オプションで調整可能。

### #initialize

* initialize(value, options = {})

value を格納する。
オプションには `expires_in` が指定できる。
どのくらい有効期間があるかを設定する。

### #value

値を取り出す。

### #expired?

期限が切れているか確認する。

### #expires_at

期限が切れる時刻を返す。


### #expires_at=

* expires_at=(value)

期限がきれる時刻を value に設定する。

### #size

値のサイズを取得します。

### #dup_value!

値をコピーします。
