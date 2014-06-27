---
title: ActionController::Raities::Helpers
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2
```

* [ソースコード](https://github.com/rails/rails/tree/v4.1.2/actionpack/lib/action_controller/railties)


ActionController::Railties::Helpers
--------------------------------------------------------------------------------

ActionController の Raitie の Helper に関する部分が分離してある。

helpers_path に応答する場合に 値の引き継ぎを行う。
