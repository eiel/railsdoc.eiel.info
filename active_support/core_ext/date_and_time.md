---
title: Core Ext DateAndTime
---

試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc1
```

Date や Time などに機能を追加されているものなので単体で読込むことはあまりなさそう。

```ruby
require 'active_support/core_ext/date_and_time/calculations'
```

include してるクラス

* [Date](/active_support/core_ext/date/calculations)

このモジュールをincludeするのに必要そうなメソッド。

* #advance(options)
* #change(optinos)
* #<=>

Calculations
--------------------------------------------------------------------------------

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/date_and_time/calculations.rb)

### DAYS_INTO_WEEK

曜日を数値へ対応させる Hash。

:monday が 0 ではじまって、:sunday は 6 となる

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/date_and_time/calculations.rb#L3-L10)

### #yesterday

1日前のオブジェクトを返します。

### #tomorrow

1日後のオブジェクトを返します。

### #today?

今日かどうか判定します。

### #past?

過去かどうか判定します。

### #future?

未来かどうか判定します。

### #days_ago(days)

引数`days`日前のオブジェクトを返します。

### #days_since(days)

引数`day`'日後のオブジェクトを返します。

### #weeks_ago(weeks)

引数 `weeks` 週前のオブジェクトを返します。

### #weeks_since(weeks)

引数 `weeks` 週後のオブジェクトを返します。

### #months_ago(months)

引数 `months' 月前のオブジェクトを返します。

### #month_since(months)

引数 `months` 月後のオブジェクトを返します。

### #years_ago(years)

引数 `years` 年前のオブジェクトを返します。

### #years_since(years)

引数 `years` 年後のオブジェクトを返します。

### #beginning_of_month

オブジェクトの月の最初の日のオブジェクトを返します。
Time や DateTime のオブジェクトの場合は 0時0分0秒となります。

at_begininng_of_month という別名があります。

### #beginning_of_quarter

オブジェクトの四半期の最初の日を返します。
四半期はそれぞれ 1月 4月 7月 10月です。

at_begininng_of_quater という別名があります。

### #end_of_quarter

オブジェクトの四半期の最後の日を返します。
Time や DateTime のような時刻を持つ場合は 23時59分59秒となります。

at_end_of_quarter という別名があります。

### #beginning_of_year

オブジェクトの年の最後の日を返します。

at_beginning_of_year という別名があります。

### #next_week(start_day = Date.beginning_of_week)

次の週の日にちを返します。デファルトでは、月曜日になります。
引数 `start_day` にシンボルを渡すと、別の曜日に変更できます。

### #next_month

次の月に進みます。日にちなどはそのままです。

### #next_quarter

次の四半期に進みます。日にちなどはそのままです。

### #next_year

次の年に進みます。日にちなどはそのままです。

### #prev_week(start_day = Date.beginning_of_week)

前の週の日にちを返します。デフォルトでは、月曜日になります。
引数 `start_day` にシンボルを渡すと、別の曜日に変更できます。

last_week という別名があります。

### #prev_month

前の月に戻ります。日にちなどはそのままです。

### #prev_quarter

前の四半期に戻ります。日にちなどはそのままです。

### #prev_year

前の年に戻ります。日にちなどはそのままです。

### #days_to_week_start(start_day = Date.beginning_of_week)

その週の最初の日から何日進んでいるか返します。
週のはじめの曜日は 引数`start_day` にシンボルを渡すことで変更できます。

### #beginning_of_week(start_day = Date.beginning_of_week)

その週の最初の日を返します。デフォルトでは月曜日を返します。
引数 `start_day にシンボルを渡すと、別の曜日に変更できます。`

at_beginning_of_week という別名があります。

### #monday

オブジェクトの週の月曜日の日付を返します。

### #end_of_week

その週の最後の日を返します。デフォルトでは日曜日を返します。
引数 `start_day にシンボルを渡すと、別の曜日に変更できます。`
`start_day` は週のはじめの週を渡すことに注意してください。

at_end_of__week という別名があります。

### #sunday

オブジェクトの週の日曜日を返します。

### #end_of_month

その月の最後の日を返します。時刻をもつ場合は 23時59分59秒となります。

at_end_of_month という別名があります。

### #end_of_year

その年の際の日を返します。時刻をもつ場合は 23時59分59秒となります。
