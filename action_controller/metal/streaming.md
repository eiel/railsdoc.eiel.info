---
title: ActionController::Streaming
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2.rc2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc2/actionpack/lib/action_controller/metal/streaming.rb)

ストリーミングをできるようにするモジュール。

render に stream オブションを指定するストリームモードになる。
HTTP 1.0 だと動作しないようになっている。

ストリーミングする際は Rack::Chunked::Body を利用する。
