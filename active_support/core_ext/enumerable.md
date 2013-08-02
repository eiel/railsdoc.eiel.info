---
title: Core Ext Enumerable
---
ActiveSupport 拡張で追加される Enumerable のメソッド
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

Enumerable へ機能を追加する方法

```ruby
require 'active_support/core_ext/enumerable'
```

Enumerable
--------------------------------------------------------------------------------
`each` メソッドが提供されてるクラスに機能を拡張します。なぜか Rangeクラスのメソッドも定義されています。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/enumerable.rb)

### #sum

* sum(identity = 0, &block)

総和をとります。対象オブジェクトに `+` メソッドが実装されている必要があります。

引数 identity は和をとるものがない場合に利用されます。

ブロックをとることもできます。この場合は ブロックを map に渡してから sum を呼ぶのに等しいです。

```ruby
[].sum "hoge"  # => "hoge"
[1,2,3,4].sum        # => 10
[1,2,3,4].sum "hoge" # => 10
[1,2,3,4].sum { |n| n*2 } # => 20
```

### #index_by

ハッシュを作成することができます。
渡したブロックに値を適用したものを key に使います。
オブジェクトのコレクションから簡単に値を選択できます。

```ruby
[1,2,3,4].index_by &:to_s  # => {"1"=>1, "2"=>2, "3"=>3, "4"=>4}
```

### #many?

ふたつ以上のオブジェクがあれば true を返します。
ブロックを渡すことで別の条件を指定できます。
any? の進化版と考えられそう。

```ruby
(1..10).many? { |n|  n > 4 } # => true
(1..10).many? { |n|  n > 9 } # => false
```

### exclude?

inlclude? の逆で同一のオブジェクトがない場合 true を返します。

### Range#sum

Range オブジェクトであっても総和をとることができます。