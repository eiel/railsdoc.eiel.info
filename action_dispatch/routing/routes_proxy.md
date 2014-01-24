---
title: ActionDispatch::Routing::Proxy
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/routing/routes_proxy.rb)

routes と scope と ルーティングのヘルパーのメソッドが使えるプロキシ。
たぶん、routes なのか scope なのか ヘルパーモジュールなのか意識しなくて使えるようにするものだと勝手に推測している。

method_missing ではヘルパーヘ処理をするのだけど scope をのもつ情報を付加する機能が追加されている。
