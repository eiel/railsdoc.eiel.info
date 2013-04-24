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
4.0.0.beta1
```

Module へ機能を追加する方法

```ruby
require 'active_support/core_ext/module'
```

Remove Method
--------------------------------------------------------------------------------

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/module/remove_method.rb)

### #remove_possible_method(method)

引数 method が定義されていれば undef 状態にするメソッドです。

### #redefine_method(method, &block)

引数 method を再定義する。メソッドの実装は 引数 block となります。