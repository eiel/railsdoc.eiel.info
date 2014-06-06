---
title: ActionController::Live
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.2.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/live.rb)

このモジュールをミックスインするとストリーミングレスポンスができるらしい。
Responseオブジェクトを Live::Response にさしかえる。
action 実行時にもいろいろやってる。

また SSE クラスを利用するとストリームレスポンスの操作を補助する。
