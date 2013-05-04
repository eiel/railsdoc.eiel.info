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

Hash へ機能を追加する方法

```ruby
require 'active_support/core_ext/hash'
```

読み込みしているライブラリ

* [active_support/xml_mini](/active_support/xml_mini)

Conversions
--------------------------------------------------------------------------------

Hashを別の形式に変換するためのメソッドが定義されています。主にXMLへの変換。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/hash/conversions'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/hash/conversions.rb)

### #to_xml

todo

### #from_xml

todo

### #from_trusted_xml

todo

### ActiveSupport::XMLConverter::DisallowedType

todo
