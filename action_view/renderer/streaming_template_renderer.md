---
title: ActionView::Streaming::Template::Renderer
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_view/renderer/streaming_template_renderer.rb)

TemplateRender のストリーミングに対応したもの。Rack::Cache の利用が必要。

ActionView::StreamingTemplateRenderer::Body
--------------------------------------------------------------------------------
each メソッドを用意することでストリーミングできるようにしているのだと考えられる。
実際には ActionView::StreamingTemplateRenderer 内で Fiber を使用して、ちょっとずつ出力を作成する模様。

ActionView::StreamingTemplateRenderer
--------------------------------------------------------------------------------
render_template を差し替えて、delatyed_render が Fiberを用いてちょっとずつ描画していく。
