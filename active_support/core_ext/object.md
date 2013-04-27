---
title: Core Ext Object
---
ActiveSupport 拡張で追加される Object のメソッド
================================================================================


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

Acts Like
--------------------------------------------------------------------------------

acts_like? を定義しています。

### #acts_like?(duck)

ダックタイピングをアシストするためのメソッド。
このメソッドは `acts_linke_date?` のようなメソッドが定義されていれば、
acts_like? :date が true を返します。

```ruby
require 'active_support/core_ext'
Date.new.acts_like? :date       # => true
Date.new.acts_like? :time       # => false
DateTime.new.acts_like? :date   # => true
DateTime.new.acts_like? :time   # => true
```

のように使えます。


Try
--------------------------------------------------------------------------------

### #try(*a, &b)

`nil` に対し必ず `nil` を呼び、それ以外のオブジェクトの場合は 引数a の名前のメソッドを呼びだします。

nil になる可能性があるオブジェクトに対して、nilの場合はなにもしないという状況では if などを使用せずに完結に書けます。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/object/try.rb#L2-L47)

### #try!(*a, &b)
