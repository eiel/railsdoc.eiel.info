---
title: Core Ext Module
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

Module へ機能を追加する方法

```ruby
require 'active_support/core_ext/module'
```

Aliasing
--------------------------------------------------------------------------------

規則に沿ったメソッド名で指定しておくことで、メソッドを置き換えることができます。

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/module/aliasing'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/aliasing.rb)


### #alias_method_chain(target, feature)

`foo` メソッドを `foo_with_feature` というメソッドに置き換えをする場合に、元の`foo` メソッドを `foo_without_feature` という名前に変更しておいてくれるメソッドです。

`alias_method_chain(:foo, :feature)` のように使用します。

接尾語に `?` がつくようなメソッドの場合は `foo_without_feature?` のように最後に `?` がつきます。

```ruby
alias_method_chain :foo?, :feature
```

は、以下と等価です。

```ruby
alias_method :foo_without_feature?, :foo?
alias_method :foo?, :foo_with_feature?
```

`?` 以外には  `!` や `=` も同様です。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/aliasing.rb#L2-L43)

利用先

* [active_support/core_ext/date/infinite_comparable](/active_support/core_ext/date#Infinite Comparable)


### #alias_attribute

* alias_attribute(new_name, old_name)

属性のエイリアスを作成することができます。`new_name`, `new_name?`, `new_name=` メソッドが定義されます。

```ruby
class User
  # name という属性があるとする
  alias_attribute :user_name, :name
  # user_name, user_name?, user_name=(x) メソッドが追加されます
end
```

Annoymous
--------------------------------------------------------------------------------

無名モジュールかどうか確認する`anoymous?` というメソッドを定義しています。

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/module/anonymous'
```

とします。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/anonymous.rb)

### #anonymous?

無名モジュールかどうか確認します。

```ruby
module M
end

M.anonymous?    # => false

m = Module.new
m.anonymous?    # => true

N = Module.new
N.anonymous?    # => false
```

Attr Internal
--------------------------------------------------------------------------------

クラス内部で利用するのを目的とした属性に対するメソッドが実装されています。

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/module/attr_internal'
```

とします。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/attr_internal.rb)

### #attr_internal_reader

* attr_internal_reader(*attrs)

引数attrs の内部属性へのゲッターを作成します。

例えば:

```ruby
class Hoge
  attr_internal_reader :goro

  def initialize
    @_goro = 'mogumogu'
  end
end

Hoge.new.goro  # => 'mogumogu'
```

のように インスタンス変数`@_goro` へのゲッターを作成してくれます。
対応するインスタンス変数は [.attr_internal_naming_format](#.attr_internal_naming_format) に依ります。

### #attr_internal_writer

* attr_internal_writer(*attrs)

`attr_internal_reader`メソッド の セッターをバージョンです。

例えば:

```ruby
class Hoge
  attr_internal_writer :goro
end

h = Hoge.new
h.goro = 'mogumogu'
h.instance_variable_get :@_goro   # => "mogumogu"
```

のように インスタンス変数 `@_goro` へのセッタを作成してくれます。

### #attr_internal_accessor

* attr_internal_accessor(*attrs)

引数attrs の内部属性のゲッター、セッターを作成します。

`attr_internal_reader` と `attr_internal_wriwer` を呼ぶだけになっています。

### .attr_internal_naming_format

内部属性にするインスタンス変数名を決めるための文字列が入っています。
デフォルトでは `@_%s` となっていて、先頭にアンダースコアがついた名前になります。

### #attr_internal_ivar_name

* attr_internal_ivar_name(attr)

* attr_internal_ivar_name(attr)

引数attr から `.attr_internal_naming` メソッドを利用して実際に変数の名前を作成します。

例:

```ruby
class Hoge
  attr_internal_ivar_name('goro')  # => "@_goro"
end
```

### attr_internal_define

* attr_internal_define(attr_name, type)

`attr_internal_reader` メソッドや `attr_internal_writer` メソッドの実装の共通部分がまとまっているメソッドです。

Attribute Accessors
--------------------------------------------------------------------------------

Module レベルの属性を定義するメソッドが実装されています。
[Class にも同様の機能があります。](class#Attribute Accessors)
Classの時が 頭に `c` がついていた代わりに `m` がついています。

この機能だけ読み込みたい場合:

```ruby
require 'active_support/core_ext/module/attribute_accessors'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/attribute_accessors.rb)

### #mattr_reader

* mattr_reader(*syms)

引数`syms` に渡した名前でゲッターを作成します。
インスタンスからもアクセスができるように同名のメソッドが定義されます。
これを定義したくない場合は、オプションとして `:instance_reader` または`:instance_accessor` を false に指定します。

例:

```ruby
class Hoge
  mattr_reader(:hoge)
  mattr_reader(:goro, instance_reader: false)
end

Hoge.hoge       # => nil
Hoge.new.hoge   # => nil

Hoge.goro       # => nil
Hoge.new.goro   # => raise NoMethodError
```

### #mattr_writer

* mattr_reader(*syms)

引数`syms`に渡した名前でセッターを作成します。
インスタンスからもアクセスができるように同名のメソッドが定義されます。
`mattr_reader`メソッド と同様にインスタンスメソッドを定義したくない場合は、オプションとして `:instance_writer` または `:instance_accessor` を false に指定します。

### #mattr_accessor

* mattr_accesor(*syms)

引数`syms` で`mattr_reader`、`mattr_writer` を呼び出します。
セッターとゲッターを定義します。
インスタンスからもアクセスができるように同名のメソッドが定義されます。
インスタンスメソッドを定義したくない場合は、オプションとして `:instance_reader` または `:instance_writer`、`:instance_accessor` をfalse に指定することで細かく調整することができます。

Delegate
--------------------------------------------------------------------------------

自分が受けたメッセージを別のオブジェクトに丸投げして、結果をそのまま返すような委譲(delegate)という機能を提供する。

この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/module/delegation'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/delegation.rb)

### #delegate

* delegate(*methods)

引数の最後にオプションを指定できます。
オプションといいながらも `:to` は必須です。
他に指定可能なオプションは `:allow_nil` と `:prefix`です。

オブジェクトに 引数`methods` のメソッドが呼ばれた場合、`:to` に指定したオブジェクトにそのメソッドを呼びだし、結果をそのまま返します。

例:

```ruby
class Hoge
  def hoge
    'hogehoge'
  end
end

class HogeChild
  delegate :hoge, to: :@hoge

  def initialize
    @hoge = Hoge.new
  end
end

HogeChild.new.hoge    # => "hogehoge"
```

`:allow_nil` オプションに `true` を指定すると `:to` の指すオブジェクトが `nil` の場合は `nil` を返すようになります。
指定しない場合は `NoMethodError` が発生します。

```ruby
class Hoge
  delegate :hoge, to: :@hoge

  def initiliaze
    @hoge = nil
  end
end

Hoge.new.hoge   # => raise NoMethodError

class Hoge
  delegate :hoge, to: :@hoge, allow_nil: true

  def initiliaze
    @hoge = nil
  end
end

Hoge.new.hoge   # => nil
```

:prefix オプションに `true` を指定すると作成するメソッドに `:to` で指定した名前が先頭につきます。

```ruby
class Hoge
  def hoge
    'hogehoge'
  end
end

class HogeChild
  delegate :hoge, to: :hoge, prefix: true
  attr_accessor :hoge

  def initilaize
    @hoge = Hoge.new
  end
end

HogeChild.new.hoge_hoge   # => "hogehoge"
```

`:prefix` オプションを使う場合は `:to` に指定するシンボルは小文字もしくはアンダースコアではじまる必要があります。

Deprecation
--------------------------------------------------------------------------------

あるメソッドが deprecation であることを設定する簡単な方法を提供する `deprecate` が実装されています。

この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/module/deprecation'
```

しかし、バグがあって動かなかった。

```ruby
require 'active_support/deprecation'
require 'active_support/core_ext/module/deprecation'
```

であれば、動作する。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/deprecation.rb)

### #deprecate

* deprecate(*method_names)

引数method_names を deprecate メッセージが出るように変更する。


例:
```ruby
class Hoge
  def hoge
    'hogehoge'
  end
  deprecate :hoge
end

Hoge.new.hoge  # 標準エラー出力に DEPRECATION WARNING: hoge is deprecated and will be removed from Rails 4.1.
```

Introspection
--------------------------------------------------------------------------------

モジュールの情報を取得するメソッドが実装されています。


この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/module/introspection'
```

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/module/introspection.rb)


### #parent_name

親モジュールの名前を取得します。親モジュールがない場合は `nil` を返します。

```ruby
module Hoge
  module Mogu
  end
end

Hoge::Mogu.parent_name   # => 'Hoge'
Hoge.parent_name         # => nil
```

### #parent

親モジュールのオブジェクトを取得します。親モジュールがない場合は `Object` を返します。

```ruby
module Hoge
  module Mogu
  end
end

Hoge::Mogu.parent    # => Hoge
Hoge.parent          # => Object
```

### #parents

すべての親モジュールを返します。

```ruby
module Hoge
  module Mogu
  end
end

Hoge::Mogu.parents  # => [Hoge, Object]
```

### #local_constants

モジュール内の定数名をシンボルで取得できます。

```ruby
module Hoge
  module Mogu
  end
end

Hoge.local_constants  # => [:Mogu]
```

### #local_constant_names

廃止予定のメソッドです。 代わりに、 local_contsnts を使用してください。
モジュール内の定数名を取得できます。

```ruby
module Hoge
  module Mogu
  end
end

Hoge.local_constants  # => ["Mogu"]
```
Qualified Const
--------------------------------------------------------------------------------

定数を操作するためのメソッドが定義されている。
ここで定義されているメソッドを使う場合、絶対パスを利用した方法で取得しようとすると NameErrorが発生するのが特徴です。

この機能だけ読み込む方法

```ruby
require 'active_support/core_ext/module/introspection'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/qualified_const.rb)

### #qualified_const_defined?

* oqualified_const_defined?(path, search_parents=true)

引数path が示す定数が定義されている。 オプション引数search_parentsを false にすると、下位モジュールのみに限定できます。


### #qualified_const_get

* qualified_const_get(path)

引数path が示す定数の値を取得します。

### #qualified_const_set

* qualified_const_set(path, value)

引数path が示す定数にvalue を設定します。

Reachable
--------------------------------------------------------------------------------

このモジュールが定数としてアクセス可能なモジュールかどうかを確認する `reachable?` メソッドが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/module/reachable'
```
* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/reachable.rb)

### #reachable?

reachbale になるには

* 匿名モジュールではない。
* [ActiveSupport::Inflector.safe_constantize](/active_support/inflector.html#.safe_constantize) を使用した場合、同じ名前になる

という条件で確認します。

reachable というのは 定数でアクセスできる。というような意味だと考えられそうです。

Remove Method
--------------------------------------------------------------------------------

メソッドを無効にしたり再定義する機能が実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/module/remove_method'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/remove_method.rb)

### #remove_possible_method

* remove_possible_method(method)

引数 method が定義されていれば undef 状態にするメソッドです。

### #redefine_method

* redefine_method(method, &block)

引数 method を再定義する。メソッドの実装は 引数 block となります。
