---
title: ActionDispatch::Middleware::SSL
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/ssl.rb)

SSL を使うための Rack ミドルウェア。
option には hsts、host、portが指定できる。hsts はハッシュで指定する。
SSL でない通信の場合は SSL になるようにてリダイレクトする模様。

hsts のデフォルトオプションは expires、subdomains が指定されている。
