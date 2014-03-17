---
title: ActionDispatch::Middleware::Session::AbstarctStore
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/session/abstract_store.rb)

Rack::Session::Abstract::ID を元にした AbstractStore が実装されている。
クッキーの保存方法と互換性を確保するための機能とセッション読み込み時のエラーへの対処の追加とセッションデータの準備に関する機能が共通機能として実装されている模様。
