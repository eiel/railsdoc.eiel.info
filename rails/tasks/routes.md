---
title: task Routes
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/tasks/routes.rake)

[ActionDispatch::Routing::RoutesInspector](action_dispatch/routing/routes_inspector)をつかって表示する。
ルーティングは Rails.application.routes.routes から取得する。
環境変数 CONTROLLER を利用するとルーティングをフィルタリングできる。
