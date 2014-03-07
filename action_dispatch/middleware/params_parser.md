---
title: ActionDispatch::ParamsParser
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/params_parser.rb)

うけとったパラメータを parse して`env["action_dispatch.request.request_parameters"] ` に格納する。
JSONの場合の処理はここで定義されており、他のものの場合はコンストラクタのparserでうけとったものを使います。
