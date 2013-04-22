---
title: Core Ext Date
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

Array へ機能を追加する方法

```ruby
require 'active_support/core_ext/array'
```

ActsLike
--------------------------------------------------------------------------------

ある型のように振る舞うための機能が定義されている。

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/date/acts_linke'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/acts_like.rb)

### #acts_like_date?

Date のように振る舞うか検査するメソッドです。
Date なので true を返すだけです。
