---
title: ActionDispatch::HTTP::FilterRedirect
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/filter_redirect.rb)


request オブジェクトの action_dispatch.redirect_filter にリストが格納されており、文字列または正規表現が保存されている。
これとマッチするような location の場合フィルターをかけることができる機能です。
[ActionController::Instrumentation](/action_controller/metal/instrumentation.rb)で利用されており、redirect する location に対し使われます。

filtered_location はfilterする必要があるものであれば '[FILTERED] という文字を返します。
