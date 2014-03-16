---
title: ActionDispatch::Middleware::Static
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/static.rb)

指定した path をルートにしたファイルがある場合はそれを返すようにする Rack ミドルウェア。 GET メソッドと HEAD メソッドにしか反応しない。

大くの処理を ActionDispatch::FileHandler に実装されている。
