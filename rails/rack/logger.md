---
title: Rails::Rack::LogTger
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/rack/logger.rb)


logger に tagged メソッドがあるかどうか代わる。
taggedメソッドがある場合は、requestオブジェクトに対しtagチェックを行う。
含ま場合はタグ付けされる。

`request.action_dispatch`イベントに反応してログを書き込みする。
