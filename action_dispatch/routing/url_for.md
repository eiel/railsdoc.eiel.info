---
title: ActionDispatch::Routing::UrlFor
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/routing/url_for.rb)

include して使う。default_url_options を用意しておくことで defaultのオプションを設定できる。
RouteSet へのインスタンスへアクセスできる必要があり @_routes に設定しておく必要がある。
`url_for` メソッドには

* nil を渡すとデフォルトオプションだけでurlを構築
* Hash を渡すとデフォルトオプションにmergeしてURLを構築
* String を渡すとそのまま返す
* その他の場合は polymorphic_urlに回して構築

polymorphhick_url は `ActionDispatch::Routing::PolymorphicRoutes` に
