---
title: ActionDispatch::Middleware::RemoteIP
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/show_exceptions.rb)

例外がおきた時の対処をする Middleware。

env['action_dispatch.show_exceptions'] == true の場合に動作する。
開発環境でエラーがでた時の画面をつくるところへの受け渡しはこの子がしている気がする。

その再に例外がおきたら事前に用意されてる 500 エラーが返る。

env['action_dispatch.show_exceptions'] == false なら例外がそのまま発生する。
