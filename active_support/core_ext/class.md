---
title: Core Ext Class
---
ActiveSupport 拡張で追加される Class のメソッドの紹介
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

class へ機能を追加する方法。

```ruby
require 'active_support/core_ext/class'
```

Attribute
--------------------------------------------------------------------------------

クラスレベル属性を導入します。

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/class/attribute'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/class/attribute.rb)。

### .class_attribute(*attrs)

このメソッドは、クラスに**クラスレベル属性**を追加します。
クラスレベル属性はクラスに対する情報を追加します。
また、この属性にはクラスのインスタンスからもアクセスできます。
同様に、サブクラスにも継承されます。

以下のような定義があるとします。

```ruby
class Base
  class_attribute :setting
end

class Subclass < Base
end
```

クラスBase オブジェクト に `setting` というクラスレベル属性が追加されています。
この時 クラスBase オブジェクトには以下の6つのメソッドが追加されます。

* Base.setting
* Base.setting=(val)
* Base.setting?
* Base#setting
* Base#setting=(val)
* Base#setting?

また、クラスBase のサブクラスである クラスSubclass にも以下の6つのメソッドが追加されます。

* Subclass.setting
* Subclass.setting=(val)
* Subclass.setting?
* Subclass#setting
* Subclass#setting=(val)
* Subclass#setting?

使ってみます。
インスタンスやサブクラスに引き継ぎされています。

```ruby
Base.setting = :hoge
Base.setting          # => :hoge
Base.new.setting      # => :hoge
Subclass.setting      # => :hoge

Base.setting = :goro
Base.setting          # => :goro
Subclass.setting      # => :goro
Base.new.setting      # => :goro
```

クラスBase の値を変更するとサブクラスやインスタンスでも値が変わります。
しかし、上書きをすると独立した値になります。

```ruby
Base.setting = :hoge
Subclass.setting = :goro

Base.setting     # => :hoge  # :goro にはならない
Subclass.setting  # => :goro

b = Base.new
b.setting = :mogu
Base.setting    # => :hoge # :mogu にはならない
b.setting       # => :mogu
Base.new.setting # => :hoge  # :mogu にはならない

Base.setting = :piyo
Base.setting     # => :piyo
Subclass.setting # => :goro  # 上書きすると Base の影響を受けない
```

メソッド`class_attribute`の 引数attrs には クラスレベル属性にしたい名前を並べることで、まとめて作成できます。

たとえば、クラス`Array' に `setting` と `support` を追加したい場合は以下のようにします。

```ruby
class Base
  class_attribute :setting, :support
end
```

また、メソッド`class_attribute` には、以下の3つのオプションが使えます。

* instance_writer
* instance_reader
* instance_accessor

`false` を指定することで インスタンスでの利用に制限することができます。

```ruby
class Base
  class_attribute :setting, instance_accessor: false
end

Base.setting = :hoge
Base.setting   # => :hoge

Base.new.setting  # => NoMethodError: undefined method `setting' for #<Base:0x007fe0420b3ba8>
```

AttributeAccessors
--------------------------------------------------------------------------------

*クラス変数*に対するゲッタ・セッタを作成する `cattr_reader` `cattr_writer` `cattr_accessor` メソッドを定義します。
*インスタンス変数*に対するゲッタ・セッタを作成する `attr_reader` `attr_writer` `attr_accessor` に `Class` の `c` をつけたもの考えられます。

Class#class_attribute と同様にそのクラスのインスタンスやサブクラスからもアクセスできます。

たとえば、以下のクラスがあるとします。

```ruby
class Base
  cattr_accessor :setting
end

class Subclass < Base
end
```

以下のように利用します。

```ruby
Base.setting = :hoge

# 以下は class_attribute のときと同じ挙動

Subclass.setting      # => :hoge
Base.new.setting      # => :hoge
Subclass.new.setting  # => :hoge

# 以下は class_attribute と挙動が違う

Subclass.setting = :goro

Base.setting         # => :goro  # class_attribute のときは :hoge
Base.new.setting     # => :goro  # 同様
Subclass.new.setting # => :goro
```

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/class/attribute_accessors'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/class/attribute_accessors.rb)。

### #cattr_reader(*syms)

クラス変数のゲッタを作成します。
引数の `syms` に複数のシンボルを渡すことで、まとめて作成することができます。

option として

* instance_reader
* instance_accessor

が利用できます。
デフォルトでは `true` で `false` を設定することで、インスタンスからのクラス変数へのアクセスを制限できます。
instance_reader, instance_accessor どちらを設定しても同じ効果になります。

### #cattr_writer(*syms)

クラス変数のセッタを作成します。
引数の `syms` に複数のシンボルを渡すことで、まとめて作成することができます。

また、ブロックを渡すことで、初期値を設定することができます。

```ruby
class Base
  cattr_writer :setting do
    [:mogu, :goro]
  end

  def setting
    @@setting
  end
end

Base.setting     # => [:mogu, :goro]```

引数のoption として

* instance_writer
* instance_accessor

の2つを使うことができます。
デファルトで `true` になっています。

### #cattr_accessor(*syms, &blk)

クラス変数のセッタ・ゲッタを作成します。
引数の `syms` に複数のシンボルを渡すことで、まとめて作成することができます。

また、ブロックを渡すことで、初期値を設定することができます。
Class#cattr_write へ委譲されます。


DelegatingAttributes
--------------------------------------------------------------------------------

スーパークラスに委譲する属性を作成する？

Attribute との違いがあまりわからなかったです。
まず、`reader` と `writer` がなく `accessor` しかありません。
ふたつめはインスタンスからの場合は代入ができません。
みっつめは、先頭にアンダースコアがついたアクセッサが作成されます。
よっつめは、配列を渡してまとめて定義することができません。

Attribute と同様サブクラスで値を上書きすると、スーパークラスに影響はありません。


この機能のみ読み込みたい場合は

```ruby
require 'active_support/core_ext/class/delegating_attributes'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/class/delegating_attributes.rb)

### #superclass_delegating_accessor(name, options = {})

第1引数に作成する属性名、`options` には `instance_reader` を設定できます。
デフォルトでは true と同様の動作します。

以下のクラスがあったとします。

```ruby
class Base
   superclass_delegating_accessor :setting
end

class Subclass < Base
end
````

利用してみます。

```ruby
Base.setting = :hoge
Base.setting          # => :hoge
Base.new.setting      # => :hoge
Subclass.setting      # => :hoge
Subclass.new.setting  # => :hoge

# Baseの値を変更。Subclass も変わる
Base.setting = :foo
Base.setting          # => :foo
Base.new.setting      # => :foo
Subclass.setting      # => :foo
Subclass.new.setting  # => :foo

# Subclassの値を変更。 Base はそのまま。
Subclass.setting = :goro
Base.setting          # => :foo
Base.new.setting      # => :foo
Subclass.setting      # => :goro
Subclass.new.setting  # => :goro

# Base の値を変更。Subclass は影響がでない
Base.setting = :hoge
Base.setting         # => :hoge
Base.new.setting     # => :hoge
Subclass.setting     # => :goro
Subclass.setting     # => :goro
```
Subclasses
--------------------------------------------------------------------------------
サブクラスの一覧を取得できるメソッド `subclasses` が定義されている。
`subclasses` 実装のための補助メソッド `descendante` も定義されている。
こちらは子孫クラスの一覧を取得できます。

この機能のみ読み込みたい場合は

```ruby
require 'active_support/core_ext/class/subclasses'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/class/subclass.rb)

### #descendants

`:nodoc` が指定されてるので仕様が固まってないのかもしれない。
子孫クラスの一覧が取得できる。

### #subclasses

子クラスの一覧を取得できます。
`ActiveRecord::Base` の `subclasses` を見ると便利そうな気がしましたが、クラス定義が呼び出すまで遅延するので、ちょっとだけ微妙。
デバッグには役立ちそうです。

### ちょっと実験

以下のクラスが定義されているとします。

```ruby
class Base
end

class SubClass < Base
end

class SubSubClass < SubClass
end
```

この時の `descendants` の挙動は以下のとおりです。

```ruby
Base.descendants        # => [SubSubClass, SubClass]

SubClass.descendants    # => [SubSubClass]

SubSubClass.descendants # => []
```

Baseを継承してるすべてのクラスを返します。

また、この時の `subclasses` の動作は以下のとおりです。

```ruby
Base.subclasses        # => [SubClass]  # ここが`descendants`と違う

SubClass.subclasses    # => [SubSubClass]

SubSubClass.subclasses # => []
```

と、直下の子クラスのみ返すようになっています。
