---
title: Core Ext LoadError
---
ActiveSupport 拡張で追加される LoodError のメソッド
================================================================================


試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

LoadError へ機能を追加する方法

```ruby
require 'active_support/core_ext/load_error'
```

LoadError
--------------------------------------------------------------------------------

読み込みするファイルがみつからなかった時に発生する例外です。
みつからなかった ファイルパス を取得する path メソッド、見つからなかったものと、対象が一致するか確認する is_missing? メソッドが実装されています。

また、 MissingSourceFile という別名をつけています。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/load_error.rb)

### #path

みつけられなかったファイルパスを取得します。
ただし、このメソッドはすでに実装されている場合は、元々実装されているものを利用します。

### #is_missing?

* is_missing?(location)

引数location をみつけることができなかったのかを確認します。
