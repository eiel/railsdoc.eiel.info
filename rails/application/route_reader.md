---
title: Rails::Application::RoutesReloader
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/application/routes_reloader.rb)

routes を読み込みするためのクラス。

RouteSet#disable_clear_and_finalize を true に変更して、false が特徴っぽい。
