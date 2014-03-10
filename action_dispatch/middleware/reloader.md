---
title: ActionDispatch::Middleware::Reloader
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/reloader.rb)

リクエストを処理する前と処理する後に処理を追加する。主に開発環境でソースコードを読み直す処理をしたりするのに利用するようだ。Rack ミドルウェアになっていて `.to_prepare` と `.to_cleanup` メソッドを使ってコールバックを作成する。
