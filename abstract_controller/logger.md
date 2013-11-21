---
title: AbstractController::Logger
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/logger.rb)

AbstarctController.logger を提供する。しかし、設定はされない。
[ActiveSupport::Benchmarkable](/active_support/benchmarkable) も include されるので、benchmark メソッドが提供される。
