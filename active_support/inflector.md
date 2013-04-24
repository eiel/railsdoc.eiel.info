---
title: ActiveSupport::Inflector
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

inflections
--------------------------------------------------------------------------------

Methods
--------------------------------------------------------------------------------

この機能のみ利用したい場合は:

```ruby
require 'active_support/inflector/methods'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/inflector/methods.rb)

### .ordinalize

数値から `1st`, `2nd`, `3rd` のような序数形式の文字列を返します。

```ruby
ActiveSupport::Inflector.ordinalize(1)  # => "1st"
ActiveSupport::Inflector.ordinalize(2)  # => "2nd"
ActiveSupport::Inflector.ordinalize(3)  # => "3rd"
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/inflector/methods.rb#L277-L299)
