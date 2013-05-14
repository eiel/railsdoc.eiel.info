---
title: Core Ext Integer
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

Integer へ機能を追加する方法

```ruby
require 'active_support/core_ext/integer'
```

Inflections
--------------------------------------------------

`1st` `2nd` などのような序数に関連したメソッドが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/integer/inflections'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/integer/inflections.rb)

### #ordinize

`1st` や `'2nd` などの序数形式の文字列に変更します。

[ActiveSupport::Inflector.ordinalize](/active_support/inflector#ordinalize) に丸投げします。

### #ordinal

`1st` や `'2nd` などの序数形式にする場合に付加する文字列を替えします。

[ActiveSupport::Inflector.ordinalize](/active_support/inflector#ordinalize) に丸投げします。
