---
title: Core Ext Numeric
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

Module へ機能を追加する方法

```ruby
require 'active_support/core_ext/numeric'
```

Bytes
--------------------------------------------------------------------------------

Byte, KByte などを便利に扱うメソッドが定義されています。

```ruby
require 'active_support/core_ext/numeric/bytes'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/numeric/bytes.rb)

### #bytes

self バイトが何バイトか返します。

```ruby
10.bytes   # => 10
```

byte というエイリアスがあります。

### #kilobytes

self キロバイトが何バイトか返します。

```ruby
10.kilobytes   # => 10240

kilbyte というエイリアスがあります。
```

### #megabytes

self メガバイトが何バイトか返します。

```ruby
10.megabytes   # => 10485760
```

megabyte というエイリアスがあります。

### #gigabytes

self ギガバイトが何バイトか返します。

```ruby
10.gigabytes   # => 10737418240
```

gigabyte というエイリアスがあります。

### #terabytes

self テラバイトが何バイトか返します。

```ruby
10.terabytes   # => 10995116277760
```

terabyte というエイリアスがあります。

### #petabytes

self ペタバイトが何バイトか返します。

```ruby
10.petabytes   # => 11258999068426240
```

petaabyte というエイリアスがあります。

### #exabytes

self エクサバイトが何バイトか返します。

```ruby
10.exabytes   # => 11529215046068469760
```

exabyte というエイリアスがあります。


Conversions
--------------------------------------------------------------------------------

数値から別の型へ変換するメソッドが定義されています。

この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/numeric/conversions'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/numeric/conversions.rb)

### to_formatted_s

* to_formatted_s(format = :default, options = {})

数値を文字列に変換します。
引数formatには :phone, :currency, :percentage, :delimited, :rounded, :human, human_size を与えることができます。
それぞれの処理は `ActiveSupport::NumberHelper.number_to_xxxxx` に委譲されます。

Numeric だけでなく Float Fixnum Bignum BigDecimal も同じメソッドが定義されます。

* [ActiveSupport::NumberHelper](/active_support/number_helper)
