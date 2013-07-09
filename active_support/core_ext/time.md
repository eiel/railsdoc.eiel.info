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

0 時から何秒経過しているかを返しします。

```ruby
Time.new(2013,1,1, 0,0,10).seconds_since_midnight    # => 10
```

### #seconds_until_end_of_day

```ruby
Time.new(2013,1,1, 23,59,10).seconds_until_end_of_day # => 49
```

### #change

* change(options)

時刻を変更します。
キーとバリューで指定します。

例:

```ruby
Time.new(2013,2,1).change month: 4 # => 2013-04-01 00:00:00 +0900
```

指定できるのは

* :year
* :month
* :day
* :hour
* :min
* :sec
* :usec

### #advance

* advance(options)

時間を進めます。
`change` メソッドと同様に キーとバリューを使って変更します。

指定できるのは

* :years
* :months
* :weeks
* :days
* :hours
* :minutes
* :seconds

です。

### #ago

* ago(seconds)

引数 `seconds` 秒前の時刻を返します

### #since

* since(seconds)

引数 `seconds` 秒後の時刻を返します。`in` というエイリアスがあります。

### #beginning_of_day

その日の0時0分0秒の 時刻を返します。
midnight at_midnight at_beginning_of_day というエイリアスがあります。

### #end_of_day

その日の23時59分59秒の 時刻を返します。
at_end_of_day というエイリアスがあります。

### #beginning_of_hour

その時刻の `時` は変更せずに 0分0秒を返します。
at_beginning_of_hour というエイリアスがあります。

### #end_of_hour

その時刻の `時` は変更せずに 59分59秒を返します。
at_end_of_day というエイリアスがあります。

### #beginning_of_minute

その時刻の `分` は変更せずに 0秒を返します。
at_beginning_of_minute というエイリアスがあります。

### #end_of_minute

その時刻の `分` は変更せずに 59秒を返します。
at_end_of_minute というエイリアスがあります。

### #all_day

その時刻が示している日の一日中を示す Rangeオブジェクト を返します。

### #all_week

* all_week(start_day = Date.beginning_of_week)

その時刻が示している週全体を示す Rangeオブジェクトを返します。
どの曜日を基準にするかは 引数 `start_day` で指定できます。

### #all_month

その時刻が示している月全体を示す Rangeオブジェクトを返します。

### #all_quarter

その時刻が示している四半期を示す Rangeオブジェクトを返します。

### #all_year

その時刻が示している年全体を示す Rangeオブジェクトを返します。

### #plus_with_duration

演算子 `+` を ActiveSupport::Duration が扱えるように機能拡張します。

### #minus_with_duration

演算子 `-` を ActiveSupport::Duration が扱えるように機能拡張します。

### #minus_with_coercion

演算子 `-` を ActiveSupport::TimeWithZone が扱えるように機能拡張します。

### #compare_with_coercion

演算子 `<=>` を ActiveSupport::TimeWithZone が扱えるように機能拡張します。

### #eql_with_coercion

eql? メソッド を ActiveSupport::TimeWithZone が扱えるように機能拡張します。

Marshal
--------------------------------------------------------------------------------

Rubyのオブジェクトをファイルに書き出す機能に timezone も含めるように拡張します。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/time/marshal'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/time/marshal.rb)

### ._load

* _load(marshaled_time)

読み込みをしてオブジェクトを復元するメソッドです。
元のメソッドを _load_without_zone と変更しメソッドを上書きしています。
`@_zone` に ゾーン情報を残しておくことで実現しています。

### ._dump

書き込みするためにオブジェクトを変換するメソッドです。
元のメソッド `_dump_without_zone`と変更しメソッドを上書きしています。
`@_zone` というインスタンス変数を追加して dump することで実現しています。

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
