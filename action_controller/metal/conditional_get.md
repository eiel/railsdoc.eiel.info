---
title: ActionController::ConditinoalGet
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionpack/lib/action_controller/metal/conditional_get.rb)

HTTP ヘッダの Etag を提供する。
たぶん、コンテンツが更新されてるか確認できる機能。

`.etag` で Etag を生成するのに利用する情報を追加できる。
`#fresh_when` で Etag を生成しつつ、変化がなければ `head :not_modified` を返す。

ActionController::ConditionalGet
--------------------------------------------------------------------------------

### .etag

* etag(&etagger)

self.etaggers に ブロックを追加して etag を生成する際に利用する。

### #fresh_when

* fresh_when(record_or_options, additional_options = {})

record を元にetag を生成。 record の updated_at も利用される。
