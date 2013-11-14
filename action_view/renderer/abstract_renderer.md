---
title: ActionView::Renderer
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_view/renderer/abstract_renderer.rb)

各 renderer の機能をまとめた抽象基底クラス。
派生クラスには

* [PartialRenderer](/action_view/renderer/partial_renderer)
* [TemplateRenderer](/action_view/renderer/template_renderer)
* [StreamingTemplateRenderer](/action_view/renderer/stream_template_renderer)

の3種類ある。

初期化時に [ActionView::LookupContext](/action_view/lookup_context)のインスタンスが必要になる。

ActionView::AbstractRenderer
--------------------------------------------------------------------------------
### extract_details

* extract_details(options)

引数options から lookup_context で利用する値を取り出します。

### instrument

* instrument(name, options={})

通知を発生される際のヘルパーで "render_#{name}.action_view" という通知を発生させます。

### prepend_formats

* prepend_formats(formats)

lookup_context に登録されている formats に先頭に追加できます。
