---
title: ActionView::Helpers::RendererHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/rendering_helper.rb)

ActionView::Helpers::RenderingHelper
--------------------------------------------------------------------------------

### render

* render(options = {}, locals = {}, &block)

引数によって view_renderer の render か render_partial のを使いわける。
ブロック引数がなくて options が Hash でない時は render_partial へ。

### _layout_for

ブロック引数に対応できるように _layout_for をオーバライドしている。
