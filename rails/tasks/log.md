---
title: task Log
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/tasks/log.rake)

logファイルを削除する `rake log:clear` が実装されている。
環境変数 LOG を指定することで削除するlogを指定できる。カンマ区切りで複数指定可能。
