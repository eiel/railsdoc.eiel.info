---
title: MimeTypes
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/mime_types.rb)

Mime::Type のデフォルト登録を行っている。Mime::Type を提供しているファイルの最後に読み込みされている。
