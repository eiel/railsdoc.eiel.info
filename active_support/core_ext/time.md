---
title: Core Ext Time
---

試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

Time へ機能を追加する方法

```ruby
require 'active_support/core_ext/time'
```

Acts Like
--------------------------------------------------------------------------------

Timeオブジェクトのように振る舞うことを示すために `acts_like_time?` メソッドが実装されています。
詳しくは [Object#acts_like?](/active_support/core_ext/object/#acts-like) を参照してください。

この機能だけ利用したい場合は:

```ruby
require 'active_support/core_ext/time/acts_like'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/time/acts_like.rb)

### #acts_like_time?

時刻オブジェクトのように振る舞うことを示します。

Calculation
--------------------------------------------------------------------------------

Time 固有の計算処理が実装されています。
Dateと共通するものは [Date and Time](/active_support/core_ext/date_and_time/) で定義されています。

この機能だけ利用したい場合

```ruby
require 'active_support/core_ext/time/calculations'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/time/calculations.rb)

### TIME::COMMON_YEAR_DAYS_IN_MONTH

月ごとの日にちが何日あるかの情報が格納されています。

```ruby
COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
```

### .===

[ActiveSupport::TimeWithZone](/active_support/time_with_zone) のインスタンスと比較しても true を返すようになっています。


```ruby
Time === Time.new  # => true

Time.zone = 'Asia/Tokyo'
Time.zone.now.class     # => ActiveSupport::TimeWithZone
Time === Time.zone.now  # => true
```

### .days_in_month

* days_in_month(month, year = now.year)

引数 month は何日まであるのかを返します。
デフォルトでは 今年の情報で返しますが、引数 year で変更することもできます。

閏年の2月の場合のみ 引数 year の情報を利用します。

```ruby
Time.days_in_month 2        # => 28
Time.days_in_month 2, 2013  # => 28
Time.days_in_month 2, 2012  # => 29
```

### .time_with_datetime_fallback

* time_with_datetime_fallback(utc_or_local, year, month=1, day=1, hour=0, min=0, sec=0, usec=0)

Derprecated なので Time.local また Time.utc を使用しましょう。

引数 utc_or_local に :utc か :local と year を指定することで 新しい Time オブジェクトを作成します。
環境によっては 指定した日付が表現できないため、DateTime の値を返す場合があります。

### .utc_time

* utc_time(*args)

Deprecated なので Time.utc を使用しましょう。
UTC の時刻で日付オブジェクトを生成します。

### .local_time

* local_time(*args)

Deprecated なので Time.local を使用しましょう。
コンピュータの設定に基いてTimeZone を決定して、時刻オブジェクトを作成します。

### .current

現在時刻の時刻オブジェクトを作成します。
`Time.zone` が設定されていてば、このタイム作成します。

```ruby
Time.zone = nil
Time.current.class  # => Time

Time.zone = 'Asia/Tokyo'
Time.current.class  # => ActiveSupport::TimeWithZone
```

### .at_with_coercion

Time.at に機能を追加します。
ActiveSupport::TimeWithZone と DateTime を引数として利用できるようになります。
DateTime を引数に使うには 'active_support/core_ext/date_time' が読み込まれている必要があります。

### #seconds_since_midnight

### #seconds_until_end_of_day

### #change

### #advance

### #ago

### #since

### #beginning_of_day

### #end_of_day

### #beginning_of_hour

### #end_of_hour

### #beginning_of_minute

### #end_of_minute

### #all_day

### #all_week

### #all_month

### #all_quarter

### #all_year

### #plus_with_duration

### #minus_with_duration

### #minus_with_coercion

### #compare_with_coercion

### #eql_with_coercion


Zones
--------------------------------------------------------------------------------

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/time/zones'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/time/zones.rb)

require されるライブラリ

* [active_support/time_with_zone](active_support/time_with_zone)

### .zone

カレントスレッドに zone 情報が保存されていればこれを返し、されていない場合はTime.zone_default に保存されている zone 情報を返します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/time/zones.rb#L7-L11)

### .zone=(time_zone)

カレントスレッドに 引数 time_zone 情報を保存します。
保存する際に有効な time_zone か確認がされます。
有効な値ではない場合は ArgumentError 例外が発生します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/time/zones.rb#L13-L38)

### .find_zone(time_zone)

引数の time_zone が示す ActiveSupport::TimeZone クラスのインスタンスを返します。
引数が有効な zone でない場合は ArgumentError 例外が発生します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/time/zones.rb#L51-L70)
