---
title: ActionView::DependencyTracker
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/dependency_tracker.rb)

ActionView::DependencyTracker
--------------------------------------------------------------------------------

トラッキング可能な形式を登録しておいて、必要な時に取り出せる。

ActionView::DependencyTracker::ERBTracker
--------------------------------------------------------------------------------

読み込みしているテンプレート調べられる。
