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

* to_xml(options = {})

Hash を XMLに変換します。

以下のようなコードの場合は、

```ruby
{'foo' => 1, 'bar' => 2}.to_xml
```

以下のようなXMLを生成します。

```
<?xml version="1.0" encoding="UTF-8"?>
<hash>
  <foo type="integer">1</foo>
  <bar type="integer">2</bar>
</hash>
```

引数 options の :bulider を設定することで、生成するXMLを変更することができます。
デフォルトでは Builder::XmlMarkup を 利用します。
が、他になにが使えるのかよく知りません。
また ブロックを渡すことで出力するXMLをカスタマイズすることもできます。

### .from_xml

* from_xml(xml, disallowed_types = nil)

XML から Hash オブジェクトを生成することができます。

処理 は ActiveSupport::XMLConverter に委譲されます。

以下のXML あれば、

```
<?xml version="1.0" encoding="UTF-8"?>
<hash>
  <foo type="integer">1</foo>
  <bar type="integer">2</bar>
</hash>
```

以下のような Hashが生成されます。

```ruby
{"hash"=>{"foo"=>1, "bar"=>2}}
```

### .from_trusted_xml

from_xml とほとんど同じように動作しますが、type が yaml や symbol の値が利用できるようになります。

```ruby
Hash.from_xml "<hoge type='symbol'>1</hoge>"  # raise ActiveSupport::XMLConverter::DisallowedType
```

```ruby
Hash.from_trusted_xml "<hoge type='symbol'>1</hoge>" #=> {"hoge"=>:"1"}
```

### ActiveSupport::XMLConverter

* initialize(xml, disallowed_types = nil)

XMLに変換するためのクラス

引数disallowed_types は デフォルトでは [:yaml,:symbol] となります。
これを無効化したい場合は、引数disallowed_types に 空のリストを渡します。

Deep Merge
--------------------------------------------------------------------------------

merge メソッドを要素に Hash がある場合再帰的に mergeする deep_merge が実装されています。

この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/hash/deep_merge'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/hash/deep_merge.rb)

### #deep_merge

* deep_merge(other_hash, &block)

基本的には Hash#merge と代わりません。
引数 other_hash は merge する hashで 引数 block は同じキーの値が存在した場合の処理を渡すことができます。
block の引数は key, oldvalue, newvalue となります。

Hash#merge と違う点は value が Hash の インスタンスの場合、再帰的に実行していく違いがあります。mergeの場合は単に上書きをします。

例:

```ruby
{a: 1, b: {x: [2], y: 1}}.deep_merge({b: {x: [3] }})
# => {:a=>1, :b=>{:x=>[3], :y=>1}}

{a: 1, b: {x: [2], y: 1}}.merge({b: {x: [3] }})
# => {:a=>1, :b=>{:x=>[3]}}
```

deep_merge のほうは キーy の値が残りますが、merge のほうは単に キーb の値を上書きをしているので、なくなってしまいます。

### #deep_merge!

* deep_merge(other_hash, &block)

deep_merge の破壊的バージョン。
新しい配列を使わず、self を書き換えます。


Diff
--------------------------------------------------------------------------------

このファイルには廃止される可能性のあるメソッドしかありません。

この機能だけ読み込む方法

```ruby
require 'active_support/deprecation'
require 'active_support/core_ext/hash/diff'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/hash/deep_merge.rb)

### #diff

* diff(other)

other との 違いを調べることができます。

```ruby
{hoge: 2}.diff(hoge: 2)          # => {}
{hoge: 2}.diff(goro: 3)          # => {:hoge=>2, :goro=>3}
{}.diff(goro: 3)              # => {:goro => 3}
{hoge: 2, goro: 4}.diff(hoge: 2) # => {:goro => 4}
```

Except
--------------------------------------------------------------------------------
Hash から特定のキー を取り除くメソッド `except` を実装しています。

この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/hash/except'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/hash/except.rb)

### #except

* except(*keys)

Hash から 引数keys に指定した キー を削除した Hash を返します。

例:

```ruby
{a: 1, b: 2}.except(:a)      # => {:b => 2}
{a: 1, b: 2}.except(:a, :b)  # => {}

h = {a: 1, b: 2}
h.except(:a)     # => {:b => 2)
h                # => {:a => 1, :b => 2}
```

### #except!

* except(!*keys)

'[except](#except-1)'メソッドの破壊的に動作するバージョンです。

例:

```ruby
{a: 1, b: 2}.except!(:a)      # => {:b => 2}
{a: 1, b: 2}.except!(:a, :b)  # => {}

h = {a: 1, b: 2}
h.except!(:a)     # => {:b => 2)
h                 # => {:b => 2}
```

Indiffernt Access
--------------------------------------------------------------------------------

Hash から [ActiveSupport::HashWithIndifferentAccess](/active_upport/hash_with_indiffrent_access) を生成する `with_indifferent_access` を実装しています。

このクラスは キーがシンボルでも文字列でも、同じ値へアクセスすることができます。

この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/hash/indifferent_access'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/hash/indifferent_access.rb)

### #with_indifferent_access

[ActiveSupport::HashWithIndifferentAccess](/active_upport/hash_with_indiffrent_access)に変換したオブジェクトを返します。

`nested_under_indifferent_access`というエイリアスもあります。

Keys
--------------------------------------------------------------------------------

Hash の key に対し操作を行うメソッドが実装されています。

この機能だけ読込む方法

```ruby
require 'active_support/core_ext/hash/keys'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/hash/keys.rb)

### #transform_keys

ブロックは必須です。

ブロックを利用して、キーを変更した Hash を返します。

例:
```ruby
hash = { name: 'Rob', age: '28' }

hash.transform_keys{ |key| key.to_s.upcase }
# => { "NAME" => "Rob", "AGE" => "28" }
```

### #transform_keys!

transform_keys の 破壊的バージョンです。

### #stringify_keys

キーを文字列に変換した Hashを返します。

`transform_keys` を利用して実装されています。

例:

```ruby
hash = { name: 'Rob', age: '28' }

hash.stringify_keys
#=> { "name" => "Rob", "age" => "28" }
```

### #stringify_keys!

`stringify_keys` の破壊的バージョンです。

### #symbolize_keys

キーをシンボルに変換した Hashを返します。

`transform_keys` を利用して実装されています。

```ruby
hash = { 'name' => 'Rob', 'age' => '28' }

hash.symbolize_keys
#=> { name: "Rob", age: "28" }
```

### #symbolize_keys!

`symbolize_keys` の破壊的バージョンです。

### #assert_valid_keys

* assert_valid_keys(*valid_keys)

self が持つ キー が valid_keys に一致しない場合に ArgumentError が発生します。

```ruby
{ name: 'Rob', age: '28' }.assert_valid_keys(:name, :age) # return self
{ name: 'Rob', age: '28' }.assert_valid_keys(:name, :years) # raise ArgmentError
{ name: 'Rob', age: '28' }.assert_valid_keys(:name) # raise ArgmentError
{ name: 'Rob', age: '28' }.assert_valid_keys('name', 'age') # raise ArgmentError
```

### #deep_transform_keys

`trasform_keys` のネストしていても辿るバージョンです。

block は必須です。

### #deep_transform_keys!

`deep_transform_keys`の破壊的バージョンです。

### #deep_stringify_keys

`deep_string_keys` のネストしていても辿るバージョンです。

### #deep_stringify_keys!

`deep_string_keys`の破壊的バージョンです。

### #deep_symbolize_keys

`deep_symbolize_keys` のネストしていても辿るバージョンです。

### #deep_symbolize_keys!

`deep_symbolize_keys`の破壊的バージョンです。

Reverse Merge
--------------------------------------------------------------------------------

`Hash` の インスタンスメソッド のレシーバと対象を入れかえた `merge` である `reverse_merge` メソッドが実装されています。

この機能だけ読込む方法

```ruby
require 'active_support/core_ext/hash/reverse_merge'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/hash/reverse_merge.rb)

### #reverse_merge

* reverse_merge(other_hash)

`other_hash.merge(self)` と同等の動作をします。

options のデフォルト値を用意する際に引数にかけてシンプルに見えます。

例:

```ruby
options = { size: 30 }
options.reverse_merge(size: 25, velocity: 10)
# => {:size=>30, :velocity=>10}

options = {}
options.reverse_merge(size: 25, velocity: 10)
# => {:size=>25, :velocity=>10}
```

### #reverse_merge!

reverse_merge の破壊的操作バージョンです。

`reverse_update` という別名があります。

Slice
--------------------------------------------------------------------------------

指定したキーだけのHash を生成する slice メソッドが実装されています。

この機能だけ読込む方法

```ruby
require 'active_support/core_ext/hash/slice'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/hash/slice.rb)

### #slice

* slice(*keys)

このメソッドは与えられた 引数keys だけの Hash を返します。
option で、有効なキーのみ残したい場合に利用します。

また、引数keys のそれぞれのkey は convert_key というメソッドをもっている場合、このメソッドによって変換されます。


例:

```ruby
{a: 0, b: 1}.slice(:a)
# => {:a => 0 }
```

### #slice!

このメソッドは slice とは逆に、与えたれた 引数 keys をと一致するキーを削除した Hash を返します。

例:

```ruby
{a: 0, b: 1}.slice!(:a)
# => {:b => 0 }
```

### #extract!

このメソッド は slice と同様に動作します。
違う点は convert_key を利用しない点です。

```ruby
{a: 0, b: 1}.extract!(:a)
# => {:a => 0}
```
