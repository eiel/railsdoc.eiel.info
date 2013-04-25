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
require 'active_support/core_ext/date/acts_like'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/acts_like.rb)

### #acts_like_date?

Date のように振る舞うか検査するメソッドです。
Date なので true を返すだけです。

Calculations
--------------------------------------------------------------------------------

日付計算に関連したメソッドが実装されています。

`DateAndTime::Calculations` が include されています。

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/date/calculations'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/calculations.rb)

### .beginning_of_week_default

`beginning_of_week` の default 値を返します。

### .beginning_of_week_default=(week_start)

`beginning_of_week` の default 値を設定します。
引数`week_start`には :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday が利用可能です。

### .beginning_of_week

週の始めの曜日を返します。
default では :monday を返します。
`beginning_of_week_default` の値で default 値が変更できます。

### .beginning_of_week=(week_start)

週の始めの曜日を設定します。
引数`week_start` には :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday が利用可能です。

### .find_beginning_of_week!(week_start)

引数 week_start が曜日として使用できる値か検索します。

### .yesterday

昨日を表現する `Date` オブジェクトを返します。
`current`メソッドでオブジェクトを作成、インスタンスメソッド `yesterday` に処理を依頼するだけ。

### .tomorrow

明日を表現する 'Date` オブジェクトを返します。
`current`メソッドでオブジェクトを作成、インスタンスメソッド `yesterday` に処理を依頼するだけ。

### .current

今日を表現する `Date` オブジェクトを返します。
`Time.zone.today` の値を返しますが、未設定であれば `Date.today` の値を返す。

### #ago(seconds)

引数 seconds 秒前の時刻を返します。
このファイルだけ読み込んだだけ場合、動作しなかった。

### #since(seconds)

引数 seconds 秒後の時刻を返します。
このファイルだけ読み込んだだけ場合、動作しなかった。

エイリアスとして `in` がある。

### #beginning_of_day

日のはじまりを返す。

エイリアスとして `midnight`, `at_midnaight`, `at_beginning_of_day` がある。

### end_of_day

日の終わりを返す。

エイリアスとして `at_end_of_day がある。

### #plus_with_duration(other)

引数other だけ日付を進める。

エイリアスとして `+` がある。もともとの + は`plus_without_duration` でアクセスできる。
引数other が `ActiveSupport::Duration の場合の処理が追加されているのでこのような名前になってると考えられる。

:o_doc がついてる。

### #minus_with_duration(other)

引数other だけ日付をもどす。

エイリアスとして `-` がある。もともとの - は`minus_without_duration` でアクセスできる。
引数other が `ActiveSupport::Duration の場合の処理が追加されているのでこのような名前になってると考えられる。

### #advance

年、月、週、日 といった単位で日付を進めるメソッド。
キーワードを使うことで値を渡す。
:years, :months, :weeks, :days が使用できる。

例:

```ruby
Date.new(2013, 12,1).advance(years: 10)  # => Fri, 01 Dec 2023
Date.new(2013, 12,1).advance(days: 10)  # => Wed, 11 Dec 2013
```

### #change

年、月、日 を直接して指定して日付を変更する。
キーワードを使うことで値を渡す。
:year, :month, :day が使用できる。

例:

```ruby
Date.new(2013,12,1).change(day: 10) # => Tue, 10 Dec 2013
Date.new(2013,12,1).change(year: 2014) # => Mon, 01 Dec 2014
```

Coversions
--------------------------------------------------------------------------------

別の形式に変換するメソッドが実装されています。

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/date/conversions'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/conversinos.rb)

require される ライブラリ

* [active_support/inflector/methods](/active_support/inflector#methods)
* [active_support/core_ext/date/zones](#zones)
* [active_support/core_ext/module/remove_method](/active_support/core_ext/module#remove_method)

`remove_possible_method` を利用するのに `remove_method` を require していてみたいだけど今は利用されていないみたい。

* [pull request してみた](https://github.com/rails/rails/pull/10339)

### DATE_FORMATS

5つの Date フォーマット形式が定義されています。

例は 2013年3月4日 の場合の実行結果になります。

* :short         - " 4 Mar"
* :long          - " March 4, 2012"
* :db            - "2012-03-04"
* :number        - "20120304"
* :long_ordinary - "March 4th, 2012"
* :rfc822        - " 4 Mar 2012"

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/conversions.rb#L7-L17)

### #to_formatted_s(format = :default)

引数format に シンボルを渡すことで整形することができます。
DATE_FORMATS で定義されてるシンボルが利用できます。
:default の場合は :db と同じ形式です。

to_s は このメソッドに置き換えられます。

元の to_s を使用したい場合は `to_default_s` を使用します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/conversions.rb#L25-L59)

### #readable_inspect

読める `inspect`。

`Sun, 04 Mar 2012`のような文字列を返します。

`inspect` メソッドはこのメソッドに置き換えられます。
元のメソッドは `default_inspect` でアクセスできます。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/conversions.rb#L61-L66)

### #to_time(form = :local)

時刻(Time)へ変換します。
引数 form には :utc も使うことができます。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/conversions.rb#L68-L79)

### #xmlschema

xmlで使用する文字列に変換します。

`2012-03-04T00:00:00+09:00`のような文字列を返します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/conversions.rb#L81-L83)

Infinite Comparable
--------------------------------------------------------------------------------

Date が Float::INFINITY などと比較できるようにします。

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/date/infinite_comparable'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/infinite_comparable.rb)

require される ライブラリ

* [active_support/core_ext/infinite_comparable](/active_support/core_ext/infinite_comparable)


Zones
--------------------------------------------------------------------------------

この機能のみ利用したい場合は:

```ruby
require 'active_support/core_ext/date/zones'
```

とします。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/zones.rb)

require されるライブラリ

* [active_support/core_ext/time/zones](active_support/core_ext/time#zones)

### in_time_zone(zone = ::Time.zone)

Time.zone の値を元に 時刻へと変換する。
第1引数に指定することで特定のタイムゾーンで行うこともできます。

引数に無効な zone を渡した場合 ArgumentError 例外が発生します。


* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/date/zones.rb#L20-L36)
