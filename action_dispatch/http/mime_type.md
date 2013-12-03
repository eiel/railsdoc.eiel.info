---
title: ActionDispatch::HTTP::MimeType
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/mime_type.rb)


ActionDispatch::HTTP::Mime::Mimes
--------------------------------------------------------------------------------

Array を継承していて利用可能な MimeType を保存しておくクラスと考えられる。map メソッドは実行結果をキャッシュするようになっている。
破壊的操作をした場合、キャッシュはクリされる。
