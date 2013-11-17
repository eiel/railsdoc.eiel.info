---
title: ActionView::TemplateRenderer
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_view/renderer/template_renderer.rb)

viewオブジェクトーをうけとって実際に描画を行う。
レイアウトの処理もここで行われる。render メソッドのオプション処理もおこなわれている。
レイアウトを含めた View の描画をしたいならここから。

ActionView::TemplateRender
--------------------------------------------------------------------------------
### render

* render(context, options)

引数には`context` ActiovView::Base のオブジェクトを渡すのが一般的。
テンプレートを実行するコンテキストとなる。

引数options には :text ,:file ,:inlinee, :template, :type, :layout などが指定できる。
layout はブロックも渡せます。

### determine_template

* determine_template(options)

options の情報からレンダリングするテンプレートを決定する。
オプション次第ではファイルの検索はしない。
戻り値は`render_template` メソッドで使う template オブジェクトを返す。

### render_template

* render_template(template, layout_name = nil, locals = nil)

`render_template.actio_view` という通知が発生させて、レンダリングをする。

### render_with_layout

* render_with_layout(path, locals)

引数`path` にレイアウトがあればレイアウトを付与する。
レイアウトよりテンプレートが先にレンダリングされるみたい。
