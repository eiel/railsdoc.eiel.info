---
title: ActionDispatch::DebugExceptions
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/debug_exceptions.rb)

Rackオブジェクトで例外がおきた場合の対処がされているところ。
終了せずに、デバッグ用の出力を生成する。

X-Cascade ヘッダー が `'pass'`の場合がRoutingError になるらしい。
