---
title: ActionDispatch::HTTP::Request
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/request.rb)

Rack::Request を継承して作られた Railsでの Requestクラス。

* [ActionDispatch::Http::Cache::Request](action_dispatch/http/cache/request)
* [ActionDispatch::Http::MimeNegotiation](action_dispatch/http/mime_negotisation)
* [ActionDispatch::Http::Parameters](action_dispatch/http/parameters)
* [ActionDispatch::Http::FilterParameters](action_dispatch/http/filter_parameters)
* [ActionDispatch::Http::Upload](action_dispatch/http/uploads)
* [ActionDispatch::Http::URL](action_dispatch/http/url)

が include されている。

XMLHttpRequest でのアクセスであるかどうか確認する xml_http_request? や request_id となる uuid や remote_ip といったメソッドが追加されてる。
環境変数に保存されてる HTTP に関する値へアクセスするメソッドも多数定義されている。
