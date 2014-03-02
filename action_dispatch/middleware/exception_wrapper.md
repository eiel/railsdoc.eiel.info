---
title: ActionDispatch::ExceptionWrapper
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/exception_wrapper.rb)

起きた例外に対する HTTPステータスコードが登録されていたりする。
例外をうけとって、コントローラレイヤーで扱うためのメソッドを提供する。
バックトレースの出力を整理したりするメソッドなどがある。
