---
title: ActionController::Head
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.2.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/head.rb)

head メソッドを提供する。

ActionController::Head
--------------------------------------------------------------------------------

### #head

HEADメソッドのためのリクエストを作る。
値を返す前に不必要なボディが削除される。
render した後に呼んでも良さそうな気がする。

第一引数がステータス(シンボル可能)で第2引数のオプションは content_type や location を渡せる。それ以外も渡すとヘッダになる模様。
