---
title: AbstractController::UrlFor
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/url_for.rb)


RouteSet のインスタンスを返す `_routes` メソッドが定義されているコントローラに url_for メソッドを提供する。
その際に `action_methods` が返す値を修正する。
