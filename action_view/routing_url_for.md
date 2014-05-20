---
title: ActionView::RoutingUrlFor
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.1/actionview/lib/action_view/routing_url_for.rb)


View ようにに url_for を拡張する。
[Routing を利用した polymorphic_path](https://github.com/rails/rails/blob/e2ae787b36e32627974a0d448694c0067327fed7/actionpack/lib/action_dispatch/routing/polymorphic_routes.rb#L103) へ処理を委譲するようになります。

only_path オプションで url と path モードを切り替えられることをしった。
