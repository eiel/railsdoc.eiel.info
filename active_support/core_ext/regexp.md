---
title: Core Ext Regexp
---
ActiveSupport 拡張で追加される Regexp のメソッド
================================================================================


試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/regexp.rb)

Regexp
--------------------------------------------------------------------------------

この機能だけ読み込みをする方法

```ruby
require 'active_support/core_ext/regexp'
```

### #multiline?

マルチラインモードの正規表現か確認します。

```ruby
//.multiline?  # => false
//m.multiline? # => true
```

特定のフラグを表現する値をマスクに使うと フラグそのものになるかどうかで、値が判断できるようです。

```
# フラグは立ってない
1100 & 0001  # => 0000
# フラグが立っていると 左辺と同じものになる
0101 & 0001  # => 0001
```
