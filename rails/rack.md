---
title: Rails::Commands
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc1/railties/lib/rails/rack.rb)

rack ディレクトリの中身を読む設定をするだけだけど ruby 2.0 以上の場合は Debuggerを読まない工夫がされている。
