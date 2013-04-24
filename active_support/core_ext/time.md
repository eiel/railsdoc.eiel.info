---
title: Core Ext Time
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
require 'active_support/core_ext/time'
```

Zones
--------------------------------------------------------------------------------

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/time/zones'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/time/zones.rb)

require されるライブラリ

* [active_support/time_with_zone](active_support/time_with_zone)

### .zone

カレントスレッドに zone 情報が保存されていればこれを返し、されていない場合はTime.zone_default に保存されている zone 情報を返します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/time/zones.rb#L7-L11)

### .zone=(time_zone)

カレントスレッドに 引数 time_zone 情報を保存します。
保存する際に有効な time_zone か確認がされます。
有効な値ではない場合は ArgumentError 例外が発生します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/time/zones.rb#L13-L38)

### .find_zone(time_zone)

引数の time_zone が示す ActiveSupport::TimeZone クラスのインスタンスを返します。
引数が有効な zone でない場合は ArgumentError 例外が発生します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/time/zones.rb#L51-L70)