---
title: Core Ext Range
---
ActiveSupport 拡張で追加される Range のメソッド
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

Range へ機能を追加する方法

```ruby
require 'active_support/core_ext/range'
```

Conversions
--------------------------------------------------------------------------------
別の形式に変換するメソッドが実装されています。

この機能だけ読込みする方法:

```ruby
require 'active_support/core_ext/range/conversions'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/range/conversions.rb)

### #to_formatted_s

* to_formatted_s(format = :default)

フォーマットされた文字列を返します。formatの種類は :default と :db があります。

:defaurt は `to_s` と同じ動作です。

:db は `BETWEEN A AND B` という形式になります。

`to_s` はこのメソッドに置き換わります。また、もとのto_s を利用したい場合は `to_default_` メソッドを利用します。
