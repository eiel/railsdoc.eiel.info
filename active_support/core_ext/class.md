---
title: Core Ext Class
---
ActiveSupport 拡張で追加される Class のメソッドの紹介
--------------------------------------------------------------------------------

試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.beta1
```

class へ機能を追加する方法。

```ruby
require 'active_support/core_ext/class'
```

Attribute
================================================================================

クラスレベル属性を導入します。

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/class/attribute'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/class/attribute.rb)。

### .class_attribute(*attrs)

このメソッドは、クラスに**クラスレベル属性**を追加します。
クラスレベル属性はクラスに対する情報を追加します。
また、この属性にはクラスのインスからもアクセスできます。
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

Base.setting = :mogu
Base.setting     # => :piyo
Subclass.setting # => :mogu  # 上書きすると Base の影響を受けない
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
