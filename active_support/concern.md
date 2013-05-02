---
title: ActiveSUpport::Concern
---

試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc1
```

無限と比較する機能を提供するモジュール。

この機能のみ利用する方法

```ruby
require 'active_support/concern'
```

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/concern.rb)

利用先 - 様々な場所で利用されています。

* [active_support/core_ext/infinite_comparable](/active_support/core_ext/infinite_comparable)
