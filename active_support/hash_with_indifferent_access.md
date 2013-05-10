---
title: Core Ext Hash
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

`ActiveSupport::HashWithIndifferentAccess` クラスが実装されています。

このクラスを利用するには

```ruby
require 'active_support/hash_with_indifferent_access'
```

とします。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/hash_with_indifferent_access.rb)

ActiveSupport::HashWithIndifferentAccess
--------------------------------------------------------------------------------
Hashを継承していて、キー が文字列でもシンボルでもアクセスできます。

`HashWithIndifferentAccess` という略称もあります。
