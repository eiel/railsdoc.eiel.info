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
