---
title: ActionDispatch::Journey::Routes
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/routes.rb)

[ActionDispach::Journey::Route](action_dispatch/joureny/route) の enumerable。
実際のリストは routes メソッドからもとれる。
named_routes というHash形式のバージョンも用意されています。

### partitioned_routes

anchored なパスですべて default_regexp? がtrueを返す route とそうでないものに分ける。

### ast

ast を返します。partitioned_routes を分離して or でくっつけてる。

### simulator

[ActionDispatch::Journey::GTG::Simulator](action_dispatch/joureny) を構築します。

### add_route

* add_route(app, path, conditions, defaults, name = nil)

route を生成して格納します。
routeの優先度がここで設定されます。
routes に含まれるルートの数が優先度になる。

name に値が指定されている場合は named_routes に設定されます。
