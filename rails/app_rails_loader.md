---
title: Rails::AppRailsLoader
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/all.rb)

`bin/rails` を探して実行する。
`bin/rails` が bundler によって生成されたものでなければ必要なファイルを読み込みする。
その場合は、`rake rails:update:bin`しろ的な警告を発する。
