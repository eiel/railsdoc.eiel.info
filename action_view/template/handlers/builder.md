---
title: ActionView::Template::Handlers::Builder
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_view/template/handlers/builder.rb)

xml を出力するための builder というツールを利用するための Handler です。
call で渡されたテンプレートを Builder で実行します。
call はRubyのコードを返す仕様になっています。
