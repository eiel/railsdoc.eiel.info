---
title: ActionController::Caching
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/actionpack/lib/action_controller/caching.rb)

コントローラレイヤーのキャッシュを提供する？
使い方があんまり書いてない。

cacheメソッドが提供される。ブロックの実行結果をキャッシュする。
第1引数がキャッシュキーになる。:controller が自動的にキーに追加される。

`config.action_controller.perform_caching` を `true` にすることで有効にできる。

ストアを変更にしたい場合は、`config.action_controller.cache_store` を設定します。
