---
title: Core Ext DateTime
---
ActiveSupport 拡張で追加される DateTime のメソッド
================================================================================

試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.beta1
```

DateTime へ機能を追加する方法

```ruby
require 'active_support/core_ext/datetime'
```

Acts Like
--------------------------------------------------------------------------------

[Object#acts_like?(duck)](/active_support/core_ext/object#Acts Like) のためのメソッドを実装しています。

DateTime は Date や Time のように扱えるので `acts_like_date?` と `acts_like_time?` が実装されています。

### #acts_like_date?

DateTime は Date のように振舞うことができるので true を返します。

### #acts_like_time?

DateTime は Time のように振る舞うことができるので true を返します。

Calculations
--------------------------------------------------------------------------------

日付計算を行うメソッドが定義されています。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date_time/calculations.rb)

### .local_offset

廃止予定です。
DateTime.civil_from_format を使用しましょう。

### .current

現在の時刻をタイムゾーン付きで返します。
タイムゾーンが設定されていない場合は、現在時刻を返します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date_time/calculations.rb#L12-L18)

### #past?

過去のオブジェクトの場合 true を返します。


### #future?

未来のオブジェクトの場合 true を返します。

### #seconds_since_midnight

一日がはじまって何秒経過したかと返します。

### #seconds_until_end_of_day

一日が終わるまで何秒かを返します。

### #change

* change(options)

年、月、日、時、分、秒を指定して時刻の変更を行ないます。
キーワードを使って値を渡します。時を設定すると分と秒は0に合わせます。
また、オフセットやスタートも設定できます。

:year, :month, :day, :hour, :min, :sec, :offset, :start を使って指定します。

例:
```ruby
DateTime.new(2013,12,1, 9,8,3).change(year: 2012) # => Sat, 01 Dec 2012 09:08:03 +0000
DateTime.new(2013,12,1, 9,8,3).change(hour: 10) # =>  Sun, 01 Dec 2013 10:00:00 +0000
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date_time/calculations.rb#L44-L66)

### #advance

* advance(options)

年、月、日、時、分、秒を指定して時刻を進めます。

:months, :weeks, :days, :hours, :minutes, :seconds を使って指定します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date_time/calculations.rb#L68-L85)

### #ago

* ago(seconds)

`seconds` 秒前の時刻を返します。

### #since

* since(seconds)

`seconds` 秒後の時刻を返します。

`in` というエイリアスがあります。

### #beginning_of_day

その日のはじまりの時刻を返します。

`midnight`, `at_midnight`, `at_beginning_of_day` というエイリアスがあります。

### #end_of_day

その日の終わりの時刻を返します。

`at_end_of_day` というエイリアスがあります。

### #beginning_of_hour

現在の時刻の 0分の時刻を返します。

`at_beginning_of_hour` というエイリアスがあります。

### #end_of_hour

現在の時刻の 59分59秒の時刻を返します。

`at_end_of_hour` というエイリアスがあります。

### #beginning_of_minute

現在の時刻の 0秒の時刻を返します。

`at_beginning_of_minute` というエイリアスがあります。

### #end_of_minute

現在の時刻の 59秒の時刻を返します。

`at_end_of_minute` というエイリアスがあります。


### utc

時刻を utc に変換します。
utc は オフセットが0の時刻です。

`get_utc` というエイリアスがあります。


### #utc?

時刻が utc かどうか判定します。


### #utc_offset

utc との差を秒で返します。
