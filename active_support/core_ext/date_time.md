---
title: Core Ext DateTime
---
ActiveSupport 拡張で追加される DateTime のメソッド
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

DateTime へ機能を追加する方法

```ruby
require 'active_support/core_ext/datetime'
```

Acts Like
--------------------------------------------------------------------------------

[Object#acts_like?(duck)](/active_support/core_ext/object#Acts Like) のためのメソッドを実装しています。

DateTime は Date や Time のように扱えるので `acts_like_date?` と `acts_like_time?` が実装されています。

### #acts_like_date?

DateTime は Date のように振舞うことができるので true を返します。

### #acts_like_time?

DateTime は Time のように振る舞うことができるので true を返します。
