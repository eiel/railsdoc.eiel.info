---
title: ActionView::Template::Handlers::ERB
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_view/template/handlers/erb.rb)

拡張子が ERB の時にテンプレートを処理するクラスが実装されています。
::Eruby::Erubyを拡張した ActionVIew::Template::Handlers::Erubis が実装されていて ActionView::Template::Handlers::ERB の実際の処理はこちらに委譲されます。

Erubis のほうは ActionView::OutputBuffer を使うように修正されています。

ERB のほうでは erb の trim_mode の指定があったり ENCODING を指定するための処理が追加されています。
