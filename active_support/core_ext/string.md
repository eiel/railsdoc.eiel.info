---
title: Core Ext String
---
ActiveSupport 拡張で追加される String のメソッド
================================================================================


試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc2
```

String へ機能を追加する方法

```ruby
require 'active_support/core_ext/string'
```

Access
--------------------------------------------------------------------------------

文字列へ配列的アクセスを可能にするメソッドが定義されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/access'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/access.rb)

### #at

* at(position)

position番目の文字を返します。最初の文字は0番目になります。`self[position]`と等価。
Rangeオブジェクトモ渡せます。

### #from

* from(position)

position番目から最後までの文字列を返します。`self[position..-1]`と書くのと等価。
下記の toを組合せて `.from(3).to(10)` のように3番目から10番目を表現可能です。

### #to

* to(position)

最初からposition番目までの文字列を返します。`self[0..position]`と書くのと等価。
上記の fromを組み合わせて`.from(3).to(10)` のように3番目から10番目を表現可能です。

### #first

* first(limit = 1)

はじめの文字を返します。 limitを指定すると、返す文字列の数が増えます。

```ruby
"hello".first   # => "h"
"hello".first 3 # => "hel"
```

### #last

* last(limit = 1)

最後の文字を返します。
limitを指定すると、返す文字列の数が増えます。

```ruby
"hello".last   # => "o"
"hello".last 3 # => "llo"
```

Behavior
--------------------------------------------------------------------------------

[Object#acts_like?](/active_support/core_ext/object/#acts-like) メソッドのためのメソッドが定義されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/behavior'
```

acts_like? も読み込む場合

```ruby
require 'active_support/core_ext/object/acts_like'
require 'active_support/core_ext/string/behavior'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/behavior.rb)

### #acts_like_string?

文字列のように扱えるかどうかを返します。Stringなので当然 `true` を返します。

このメソッドは `Object#acts_like?` の振舞いに影響を与えます。

```ruby
String.new.acts_like? :string  # => true
```

Conversions
--------------------------------------------------------------------------------

文字列を別のオブジェクトに変換するメソッドが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/conversions'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/conversions.rb)

### #to_time

* to_time(form = :local)

文字列を日時へと変換します。パースエラーの場合はnilを返します。
また、文字列を引数formには :utc を渡すとUTCを返します。

### #to_date

日付に変更へと変換します。 `Date.parse` に丸投げです。

### #to_datetime

文字列を日時へと変換します。 `DateTime.parse` へ丸投げです。


Encoding
--------------------------------------------------------------------------------

Deprecate なメソッドしか定義されていません。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/encoding'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/encoding.rb)

### #encoding_aware?

deprecate。現在は常に true を返します。

Exclude
--------------------------------------------------------------------------------

include? の逆の動作をする exclude? が実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/exclude'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/exclude.rb)

### #exclude?

* exclude?(string)

include? を呼びだして、否定をとる。include?の逆の動作をするだけのメソッドです。
引数string を含まない場合に true を返します。

Filters
--------------------------------------------------------------------------------

文字列のためのフィルタが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/filters'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/filters.rb)

### #squish

文字列の前後にある ホワイトスペース を削除して、文字の間にあるホワイトスペーツをひとつにまとめます。

例:

```ruby
"   hoge \n \t goro   ".squish # => "hoge goro"
```

### #squish!

String#squish の破壊的バージョンです。

### #truncate

* truncate(truncate_at, options = {})

長い文字列を短くするメソッドです。短かくなった場合 '...' が後ろにつきます。
'...' を含めて文字列の長さが 引数truncate_at になるようにします。

options には :omission と :separator を指定することができます。

:omission は後ろにつける `...` を変えることができます。

:seprator は文字列を短くする際に区切りにする部分を指定します。引数trruncate_at に指定した部分より前で削除されます。

truncat_at が :omission より短い場合、バグがある。

```ruby`
"hoge goro mogu".truncate 10  # => "hoge go..."
"hoge goro mogu".truncate 10, omission: '..'  # => "hoge gor.."
"hoge goro mogu".truncate 10, separator: ' '  # => "hoge..."
"hoge goro mogu".truncate 10, separator: /o/   # => "hoge g..."

# 削除されるものがない場合 :omission は付かない
"hoge goro mogu".truncate 20   # => "hoge goro mogu"
```

Indent
--------------------------------------------------------------------------------

文字列をインデントしてくれる indent メソッドが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/indent'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/indent.rb)

### #indent

* indent(amount, indent_string=nil, indent_empty_lines=false)

### #indent!

```
def hoge
  puts
hoge
```

のような文字列を

```
  def hoge
    puts
  hoge
```

のようにインデントをつけることができるメソッド。

引数amount の量だけ 引数indent_string を前方に挿入します。
引数 indent_string はタブでインデントしてある文字列であればタブでインデントを行います。そうでない場合はデフォルトで スペースを利用します。
明示することで好きな文字を使うことができます。

引数 indent_empty_lines を true にすると空行もインデントを挿入できます。

* indent!(amount, indent_string=nil, indent_empty_lines=false)

`indent` メソッドの破壊的バージョン
