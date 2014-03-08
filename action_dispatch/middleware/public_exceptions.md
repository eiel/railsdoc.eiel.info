---
title: ActionDispatch::Middleware::PublicException
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/public_exceptions.rb)

Rack Middleware というより Rack オブジェクト？

PATH_INFO にステータスコードが含まれてる時にまわってきて public_path にあるステタースコードと一致するファイルをrenderする。

render メソッドに `body.respond_to?(format)` という処理があるけど、絶対にtrueにならないように見えて少し謎でした。
