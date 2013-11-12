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

View をレンダリングするためのクラスで [LookupContext](/action_view/lookup_context)が必要になります。
内部は適切な render へ処理を渡すためのラッパーになっており、状態に応じて
[StreamingTemplateRenderer](/action_view/renderer/streaming_template_renderer) や[TemplateRenderer](action_view/renderer/template_renderer), [PartialRenderer](/action_view/renderer/partial_renderer) へと処理を回します。

render する際には context と options が必要になります。
これは controller からデータをうけとるためと考えると良さそうです。
