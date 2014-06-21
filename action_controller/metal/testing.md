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

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc2/actionpack/lib/action_controller/metal/testing.rb)

ActionController::Base に include して使うとテスト用に使えるようになる？

before_action の一覧を取得する .before_filters とかとれるけど使われてなさそう。

header の保存を上書きしていて、@_response の headers を差し替えるようになってるけど、デフォルトの処理はどうなってんだろ…
