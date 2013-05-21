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

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/aliasing.rb)


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


### #alias_attrib ute
* alias_attribute(new_name, old_name)

属性のエイリアスを作成することができます。`new_name`, `new_name?`, `new_name=` メソッドが定義されます。

```ruby
class User
  # name という属性があるとする
  alias_attribute :user_name, :name
  # user_name, user_name?, user_name=(x) メソッドが追加されます
end
```

Remove Method
--------------------------------------------------------------------------------

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/module/remove_method.rb)

### #remove_possible_method(method)

引数 method が定義されていれば undef 状態にするメソッドです。

### #redefine_method(method, &block)

引数 method を再定義する。メソッドの実装は 引数 block となります。
