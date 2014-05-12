---
title: ActionView::Flows
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

OutputFlow と StreamingFlow のふたつのクラスが定義されています。

ActionView::Context#_layout_for の戻り値となる値が格納される。
ほとんどHashのラッパーのような構成になってる。

StreamingFlow のほうは Streaming するための仕掛けがはいっている。
