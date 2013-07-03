---
title: Core Ext BigDecimal
---
ActiveSupport 拡張で追加される BigDecimal のメソッドの紹介
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

BigDecimal へ機能を追加する方法

```ruby
require 'active_support/core_ext/big_decimal'
```

[BigDecimal](http://rurema.clear-code.com/query:BigDecimal/) は可変長不動小数点クラスです。
要するに大きな数字や小さな数字を表現できる

Conversion
--------------------------------------------------------------------------------

別の型への変換に関するメソッドが集約されてます。

[ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/big_decimal/conversions.rb)

### encode_with(corder)

YAMLにエンコードする際に呼ばれるメソッドです。
Infinity や NaN への対応処理がされてます。

### to_d

BigDecimal に変換するメソッドです。定義されていない環境の場合に生成します。
self を返すだけ。

### to_formatted_s(*args)

引数を指定しなければ、指数を使わない形式で出力されます。また、symbol を渡した場合は スーパークラスに処理を委譲します。 試したら、結果は同じでした。

また、BigDecimal#to_s のフォーマットの文字列を渡してもちゃんと動作します。

他の to_formatted_s と同様 to_s に差し替えられています。


また、このメソッドにシンボルを渡したい場合は

```ruby
require 'active_support/core_ext/numeric/conversions'
```

しておく必要があります。

```ruby
b = BigDecimal.new('0.1')
b.to_formatted_s           # => "0.1"
b.to_s                     # => "0.1"

b.to_s 'E'                 # => "0.1E0"
b.to_s :db                 # => "0.1"
```
