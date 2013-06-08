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
4.0.0.rc1
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

# deep_dup

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

Try
--------------------------------------------------------------------------------

### #try(*a, &b)

`nil` に対し必ず `nil` を呼び、それ以外のオブジェクトの場合は 引数a の名前のメソッドを呼びだします。

nil になる可能性があるオブジェクトに対して、nilの場合はなにもしないという状況では if などを使用せずに完結に書けます。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/object/try.rb#L2-L47)

### #try!(*a, &b)
