---
title: Core Ext URI
---
ActiveSupport 拡張で追加される URI のメソッド
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

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/uri.rb)

URI
--------------------------------------------------------------------------------

文字列を正しく unescape できるかどうかを確認して、できない場合は `URI::Parser.unescape` を再定義するという方法をとっていて面白い。
URI::Parser のインスタンスを提供する `URI.parser` というメソッドを提供しています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/uri'
```

### .parser

`URI::Parser` のインスタンスにアクセスできます。
初めてアクセスした時にインスタンスが生成されるようになっています。(遅延生成)
