---
title: AbstractController::Collector
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/collector.rb))

利用可能な mime/type ためのインターフェースを提供する。実装自体は `custom` というメソッドに委譲している。
html であれば `.html` というクラスメソッドが作成される。
これは  `custom(Mime::HTML, *args, &block)` という呼び出しをする。
