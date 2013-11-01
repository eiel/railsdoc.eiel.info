---
title: ActionView::Template::Handlers::Raw
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_view/template/handlers/raw.rb)

そのまま文字列として使える形式のテンプレート。
評価できる文字列に変換するための処理が入っているだけ。
