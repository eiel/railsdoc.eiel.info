---
title: AbstractController::ViewPaths
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/view_paths)

[ActionView::PathSet](action_view/path_set)をクラス変数に保持していて、テンプレートの保存先を記録、探す手段がある。
[ActionView::LookupContext](/action_view/lookup_context) への対話役も果たす。
親のクラス名によって prefix を生成する機能も備えてる。

あとは view_path を追加する機能をもつ。

AbstroctController と ActionView の繋ぎ役と見なせそう。
