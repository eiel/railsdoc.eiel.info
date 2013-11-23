---
title: AbstractController::Translation
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/translation.rb)

`I18n.translate` と `I18n.localize` へのショットカット `translate` と `localize` を提供する。
さらに短い `t` と `l` も存在する。

`localize` のほうは単なるラッパーだが、`translate`のほうはドットではじまる場合は相対値になり `controlller名.action名.指定した値`となる。
