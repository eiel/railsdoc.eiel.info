---
title: ActionView::Context
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/context.rb)

ActionView::CompiledTemplates
--------------------------------------------------------------------------------

コンパイルされたビューが挿入されるモジュールらしい。なんにも実装されていない。

ActionView::Context
--------------------------------------------------------------------------------

CompiledTemplate がミックスインされている。
ActionView と協調して動作するには、このモジュールミックスインする。

### _prepare_context

インスタンス変数を初期化する。
機能拡張する際には必要に応じて、オーバライドすることになるのかも。

### _layout_for

layout を決める部分みたいだけど機能拡張する場合にはオーバライドしてごにょごにょしたりするっぽい。要調査。
