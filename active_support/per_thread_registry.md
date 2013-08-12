---
title: ActiveSupport::PerThreadRegistry
---

試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/per_thread_registry.rb)

Rails 4 で追加されたモジュール。

Threadごとの固有の自分自身インスタンスを自動的に作成し、クラスメソッドのように自分自身にアクセスできます。

利用には extend するだけです。

```ruby
require 'active_support/per_thread_registry'

class Hoge
  extend ActiveSupport::PerThreadRegistry

  attr_accessor :mogu
end

Hoge.mogu = "mogu1"

t = Thread.new do
  Hoge.mogu  # => nil
  Hoge.mogu = "mogu2"
  Hoge.mogu  # => "mogu2"
end

Hoge.mogu # => "mogu1

t.join
```

例で `attr_accessor` しているのは単にアクセスするメソッドを用意しているだけです。
`Mogu.hoge` というのは `Mogu`で自分自身のインスタンスにアクセスし、`hoge` で `Mogu#hoge` にアクセスし、スレッドごとにMoguのインスタンスが変わる感じです。

`method_missing` を利用しているのでクラスメソッドを定義してしまうと呼び出せません。インスタンスは必要になったときにはじめて、作成されます。
