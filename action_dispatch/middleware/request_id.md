---
title: ActionDispatch::Middleware::RequestID
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/request_id.rb)

`ActionDispatch::Request#uuid` でRequestユニークな値を作る。
リクエストヘッダにHTTP_X_REQUEST_ID付与されている場合はこれを使用する。

ログからクライアントとの対応がとったりできる？

Rackミドルウェアになっている。
HTTP_X_REQUEST_ID ヘッダがない場合はランダムな値をつくる。
