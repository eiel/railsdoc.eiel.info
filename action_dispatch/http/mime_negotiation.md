---
title: ActionDispatch::HTTP::MimeNegotiation
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/mime_negotiation.rb)

`content_type` メソッドを提供する。
`@env[CONTENT_TYPE]` に格納されている情報を解析して `@env["action_dispatch.request.content_type"]`に格納される。

同様に `@env['HTTP_ACCEPT']` も `@env["action_dispatch.request.accepts"]` に格納される。

また、formats メソッドで返せるファイルタイプ一覧を生成され優先順位順に並んでいる。
`xhr` 環境であれば JavaScript で指定がなければ HTML を返すことになる。
これらは `formats=` や `format=`で調整できる。
