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
