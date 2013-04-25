---
title: Core Ext Object
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

Object へ機能を追加する方法

```ruby
require 'active_support/core_ext/object'
```

Try
--------------------------------------------------------------------------------

### #try(*a, &b)

`nil` に対し必ず `nil` を呼び、それ以外のオブジェクトの場合は 引数a の名前のメソッドを呼びだします。

nil になる可能性があるオブジェクトに対して、nilの場合はなにもしないという状況では if などを使用せずに完結に書けます。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/object/try.rb#L2-L47)

### #try!(*a, &b)
