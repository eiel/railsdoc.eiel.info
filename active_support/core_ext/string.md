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
