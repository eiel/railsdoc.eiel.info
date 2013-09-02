---
title: ActiveSupport::Cache::FileStore
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

キャッシュデータの保存先はファイルになります。
他のキャッシュと違う点として初期化に cache_path の指定が必須になります。

エントリ削除時に空のディレクトリになった場合、掃除するようにもなっています。

ActiveSupport::Cache::FileStore
--------------------------------------------------------------------------------

### #initialize

* initialize(cache_path, options = nil)

他のストアと違い引数がひとつ必須になります。
`cache_path` はキャッシュの保存先の基準となる場所です。

### #clear

* clear(options = nil)

すべてのキャッシュファイルを削除します。削除対象のディレクトリを`rm -rf`と同様の削除をします。

options は動作に影響を与えない

### #cleanup

* cleanup(options = nil)

期限切れのデータを削除します。

### #increment

* increment(name, amount = 1, options = nil)

引数`name` に該当するキャッシュを +1 します。
値が存在しない場合は何もしません。

増加量を変更したい場合は引数`amount` を指定します。

### #decrement

* decrement(name, amount = 1, options = nil)

引数`name` に該当するキャッシュを -' します。
値が存在しない場合は何もしません。

減少量を変更したい場合は引数 `amount` を指定します。

### #delete_matched

* delete_matched(matcher, options = nil)

引数`matcher` にマッチするキャッシュを削除します。
`ActiveSupport.instrument`が `true` であれば、`cache_delete_matched.active_support` という通知が発生します。
