---
title: Core Ext NameError
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

NameError へ機能を追加する方法

```ruby
require 'active_support/core_ext/name_error'
```

存在しない変数やメソッド、定数にアクセスした際に起きる例外です。
この機能の読み込みで定数がみつけられなかった場合はその名前を取得できます。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/name_error.rb)

### #missing_name

みつからなかった定数の名前を取得できます。

```ruby
begin
  Hoge
rescue => e
  e.missing_name  # => "Hoge"
end
```

### #missig_name?

* missing_name?(name)

みつからなかった名前が 引数name と等しいか確認します。
name がシンボルの場合はモジュールの最下層の定数だけで比較します。
動作が変わるので注意。

例:

```ruby
Mogu = Module.new
begin
  Mogu::Hoge
rescue => e
  e.missing_name  # => "Mogu::Hoge"
  e.missing_name? :Hoge        # => true
  e.missing_name? "Hoge"       # => false
  e.missing_name? "Mogu::Hoge" # => true
end
```
