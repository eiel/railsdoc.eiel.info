---
title: Core Ext Module InfiniteComparable
---

試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.beta1
```

無限と比較する機能を提供するモジュール。

この機能のみ利用する方法

```ruby
require 'active_support/core_ext/infinite_comparable'
```

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/infinite_comparable.rb)

利用先

* [active_support/core_ext/date/infinite_comparable]

require するライブラリ

* [active_support/concern](/active_support/concern)
* [active_support/core_ext/module/aliasing](/active_support/core_ext/module#Aliasing)
* [active_support/core_ext/object/try](/active_support/core_ext/object#Try)

### #<=>_with_infinity(other)

右辺に FLoat::INFINITY, -FLOAT::INFINITY をもってきたときも `<=>` できるようにするメソッド。

alias_method_chain によって `<=>` と置き換えられる

```ruby
Date.today <=> -Float::INFINITY  # => 1
Date.today <=> Float::INFINITY   # => -1
```

ruby 2.0.0 だと require しなくても同じ結果だった。