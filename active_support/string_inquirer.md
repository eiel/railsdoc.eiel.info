---
title: ActiveSupport::Inuirer
---


試した環境

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/string_inquirer.rb)

問い合わせができる文字列クラスです。

例

```ruby
require 'active_support/string_inquirer'

string = ActiveSupport::StringInquirer.new('hoge')
string.hoge?    # => true
string.mogu?    # => false
```

例のように `"hoge"` という文字列であれば `hoge?` というメソッドが true を返します。
method_missing を使い実装されています。`Rails.env` がこのクラスになっています。
