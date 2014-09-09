---
title: Rails::Console::Helpers
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/console/helpers.rb)

rails c で使えるコマンドが実装されている。

Rails::Console::App
---

### helpers

ActionController.helpers を返す。
ここからhelperへのアクセスができる。

### controller

ApplicationController.new を返す。
