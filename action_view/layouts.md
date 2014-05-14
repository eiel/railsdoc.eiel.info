---
title: ActionView::Layouts
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/layouts.rb)

Controller で ActionView::Layouts をミックスインすると layout 機能を利用できるようになる。

ActionView::Layouts
--------------------------------------------------------------------------------

Controller ごとに layout に使う情報はひとつしかもてない。
アクションごとに分岐したい場合は layout にメソッドや Proc を渡すことになる。
デフォルトでは、クラス名をベースにレイアウトが決まる。メソッドを渡すにはシンボルで指定する。

`._layout_write_method` は `#_layout` を上書きするアレな感じの仕組みになってる。


