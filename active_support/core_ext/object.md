---
title: Core Ext Object
---
ActiveSupport 拡張で追加される Object のメソッド
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

Object へ機能を追加する方法

```ruby
require 'active_support/core_ext/object'
```

Acts Like
--------------------------------------------------------------------------------

acts_like? を定義しています。

この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/object/acts_like'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/object/acts_like.rb)

### #acts_like?(duck)

ダックタイピングをアシストするためのメソッド。
このメソッドは `acts_linke_date?` のようなメソッドが定義されていれば、
acts_like? :date が true を返します。

```ruby
require 'active_support/core_ext'
Date.new.acts_like? :date       # => true
Date.new.acts_like? :time       # => false
DateTime.new.acts_like? :date   # => true
DateTime.new.acts_like? :time   # => true
```

のように使えます。

Blank
--------------------------------------------------------------------------------

中身があるかどうかを判定する `blank?` メソッドやそれに関係するメソッドが実装されています。

この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/object/blank'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/object/blank.rb)

### #blank?

空のようなものは true を変えします。該当するものは

* nil
* false
* ''
* ' ' -     空白の文字列'
* []
* {}

です。

実装的には empty? メソッドが存在するかどうか。empty? が true を返すかどうかによって変わります。

基本的なクラスには empty? が実装されます。

### presenct?

blankの逆に何か有効な値は True を返します。

### presence

空ではない場合、値を返すバージョンです。

Conversions
--------------------------------------------------------------------------------

オブジェクトを別の型に変換する。他のファイルを読み込みするだけ。

* [Object#to_param](#to_param)
* [Object#to_query](#to_query)
* [Array Conversions](/active_support/core_ext/array/conversions)
* [Hash Conversions](/active_support/core_Ext/hash/conversions)

あたりを読み込む。

これだけ読み込むには:

```ruby
require 'active_support/core_ext/object/conversions'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/object/conversions.rb)

Deep Dup
--------------------------------------------------------------------------------

深いコピーを提供する `deep_dup` メソッドが実装されています。
`deep_dup` メソッド は `Object`、 `Array`、 `Hash` へ追加されます。
コピーできないシングルトンなオブジェクトなどはコピーをせずに参照を渡します。

この機能だけ読み込むには:

```ruby
require 'active_support/core_ext/object/deep_dup'
```

### #deep_dup

深いコピーを提供します。
dup と動作比較をします。

```ruby
a = ["a","b","c"]
b = a.dup
b[1] << "b"
b     # => ["a","bb","c"]
a     # => ["a","bb","c"]

a = ["a","b","c"]
b = a.deep_dup
b[1] << "b"
b     # => ["a","bb","c"]
a     # => ["a","b","c"]
```

前者は 配列の要素は同じオブジェクトを指しています。
後者は 配列の要素は新しいオブジェクトになっています。

Duplicable
--------------------------------------------------------------------------------

オブジェクトのコピーができるかどうかを確認する `duplicable?` メソッドを実装します。

この機能だけ読み込みする方法:

```ruby
require 'active_support/core_ext/object/duplicable'
```

### #duplicable?

オブジェクトのコピーができるかどうか確認するメソッドです。
Object を継承しているオブジェクトは基本的に true を返します。

以下のクラスのインスタンスは `false` を返します。

* NilClass
* FalseClass
* TrueClass
* Symbol
* Numeric
* BigDecimal

Inclusion
--------------------------------------------------------------------------------

オブジェクトが対象に含まれているか確認するメソッド `in?` が定義されています。
4.0.0.rc2 で Deprecated になりました。変わりに Object#include? を利用しましょう。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/object/inclusion'
```

### #in?

* in?(*args)

self が args に含まれているか確認します。

Array#include? を利用して実装されています。

```ruby
:hoge.in? :hoge, :goro  # => true
:mogu.in? :hoge, :goro  # => false
```

引数がひとつの場合はそのオブジェクトの `include?` メソッドを利用して動作します。
`include?`  メソッドを持たないオブジェクトを渡した場合 `ArgumentError` が発生します。

```ruby
:hoge.in? hoge: 1 , goro: 2  # => true
:mogu.in? hoge: 1 , goro: 2  # => flase

:hoge.in? 1      # raise: ArgumentError: The single parameter passed to #in? must respond to #include?
```

Instance Variables
--------------------------------------------------------------------------------

インスタンス変数に関する情報を取得するメソッドが実装されちます。

この機能だけ読み込みたい場合:

```ruby
require 'active_support/core_ext/object/instance_variables'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/object/instance_variables.rb)


### #instance_values

インスタンス変数の一覧を Hash で返すメソッドです。
key にインスタンス変数名 value に値が入ります。
key には @ のつかない名前が入ります。

```ruby
class Hoge
  def initialize
    @x, @y = 1, 2
  end
end

Hoge.new.instance_values # => {"x"=>1, "y"=>2}
```

### #instance_variable_names

インスタンス変数名の一覧を文字列で返します。
@ がついている変数名が返ります。

似たメソッドとして Object#instance_variables があります。
こちら文字列ではなく、シンボルを返します。

```ruby
class Hoge
  def initialize
    @x, @y = 1, 2
  end
end

Hoge.new.instance_variable_names # => ["@x", "@y"]

```

To JSON
--------------------------------------------------------------------------------

Object に to_json メソッドを実装します。
実際のJSON への エンコード は [ActiveSupport::JSON](/active_support/json/ )で実装されています。

`json` ライブラリを読込み後に Object, Array, FalseClass, Float, Hash, Integer, NilClass, String, TrueClass クラスで to_json メソッドを上書きするという少しトリッキーなことをしていました。

また to_json するための hash は as_json というメソッドを利用するようです。

この機能だけ読込むには:


```ruby
require 'active_support/json/encoding'
```

依存関係の問題で、'active_support/json/encoding' を読込むことになります。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/object/to_json.rb)


### #to_json

* to_json(option = nil)

オブジェクトを JSON に変換します。
処理自体は [ActiveSupport::JSON.encode](/active_support/json/) へ委譲することになります。

option は ActiveSupport::JSON のインスタンス変数となります。as_jsonメソッド などにも伝搬されます。


### Process::Status#as_json

* as_json(options = nil)

Process::Status を encode_json メソッドが実装されているオブジェクトに変換します。
ここに定義されてる理由は謎。

To Param
--------------------------------------------------------------------------------

オブジェクトを URL や QUERY_STRING へ変換するメソッド `to_param` が実装されています。
`url_for` などのメソッドを利用して URL を作成する場合に利用されます。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/object/to_param'
```

ただし、 Hash#to_param が to_guery を利用するため、

```ruby
require 'active_support/core_ext/object/to_query'
```

とするほうが気兼ねなく使えます。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/object/to_param.rb)

### #to_param

Object, Nilclass, TrueClass, FalseClass, Array, Hash に `to_param` メソッドが提供されています。
Objectの `to_param` の実装は、to_s のエイリアスとなっています。`to_s` とは挙動を変えたい場合は、サブクラスで `to_param` をオーバーライドすることになります。
自然なURLを作成したい場合にオーバーライドすることになります。

```ruby
Object.new.to_param # => "#<Object:0x007ff263abf600>"
nil.to_param        # => nil
true.to_param       # => true
false.to_param      # => false
```

Arrayの場合は `/` で区切られます。

```ruby
[].to_param         # => ""
[:hoge,:mogu].to_param # => "hoge/mogu"
```

Hashの場合は key=value 形式になります。key でソートされるため、パーマリンクも作りやすい。
引数にオプションとして namespace を設定することができます。
うまく使うとモデルのないフォームも扱いやすくなりそうです。

```ruby
{}.to_param                 # => ""
{hoge: 0}.to_param          # => "hoge=0"
{hoge: 0, mogu:1}.to_param  # => "hoge=0&mogu=1"
{mogu:1, hoge: 0}.to_param  # => "hoge=0&mogu=1"
```

To Query
--------------------------------------------------------------------------------

オブジェクトを QUERY_STRING で利用する文字列に変換します。key1=value2&key2=value2 のような構造をとります。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/object/to_query'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/object/to_query.rb)

### #to_query

* to_query(key)

QUERY_STRING を構築します。
key を指定することで key-value の関係を作成します。
この形式である必要があるので key は必須になります。

レシーバがHash の場合は key が必須でなくなります。
Hash はすでに key-value の形式になっているからです。
また、この時は to_param メソッドのエイリアスになっているだです。key を指定した場合は Hash#to_param と同じ動作をします。

Try
--------------------------------------------------------------------------------

### #try(*a, &b)

`nil` に対し必ず `nil` を呼び、それ以外のオブジェクトの場合は 引数a の名前のメソッドを呼びだします。

nil になる可能性があるオブジェクトに対して、nilの場合はなにもしないという状況では if などを使用せずに完結に書けます。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/object/try.rb#L2-L47)

### #try!(*a, &b)
