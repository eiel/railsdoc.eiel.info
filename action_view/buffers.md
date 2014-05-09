---
title: ActionView::Buffers
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/buffers.rb)

Viewで利用する Buffer クラスが定義されている。
ストリーミング用の StreamingBuffer と OutputBuffer が用意されてる。

ActionView::OutputBuffer
--------------------------------------------------------------------------------

[ActiveSupport::SafeBuffer](/active_support/safe_buffer) を継承してる。
使う前に `encode!` が実行されるようになっている。
append と safe_buffer メソッドに追加される値が nil 場合は何もしないように修正している。

ほとんど ActiveSupport::SafeBuffer です。

ActionView::StreamingBuffer
--------------------------------------------------------------------------------

イニシャライザに call できるオブジェクトを渡して、OutputBuffer でやっているようなことをする。
きっと、Fiber が使われてるオブジェクトに対し使うんだろう。
たぶん…。
