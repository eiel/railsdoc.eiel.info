---
title: Core Ext String
---
ActiveSupport 拡張で追加される String のメソッド
================================================================================


試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

String へ機能を追加する方法

```ruby
require 'active_support/core_ext/string'
```

Access
--------------------------------------------------------------------------------

文字列へ配列的アクセスを可能にするメソッドが定義されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/access'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/access.rb)

### #at

* at(position)

position番目の文字を返します。最初の文字は0番目になります。`self[position]`と等価。
Rangeオブジェクトも渡せます。

### #from

* from(position)

position番目から最後までの文字列を返します。`self[position..-1]`と書くのと等価。
下記の toを組合せて `.from(3).to(10)` のように3番目から10番目を表現可能です。

### #to

* to(position)

最初からposition番目までの文字列を返します。`self[0..position]`と書くのと等価。
上記の fromを組み合わせて`.from(3).to(10)` のように3番目から10番目を表現可能です。

### #first

* first(limit = 1)

はじめの文字を返します。 limitを指定すると、返す文字列の数が増えます。

```ruby
"hello".first   # => "h"
"hello".first 3 # => "hel"
```

### #last

* last(limit = 1)

最後の文字を返します。
limitを指定すると、返す文字列の数が増えます。

```ruby
"hello".last   # => "o"
"hello".last 3 # => "llo"
```

Behavior
--------------------------------------------------------------------------------

[Object#acts_like?](/active_support/core_ext/object/#acts-like) メソッドのためのメソッドが定義されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/behavior'
```

acts_like? も読み込む場合

```ruby
require 'active_support/core_ext/object/acts_like'
require 'active_support/core_ext/string/behavior'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/behavior.rb)

### #acts_like_string?

文字列のように扱えるかどうかを返します。Stringなので当然 `true` を返します。

このメソッドは `Object#acts_like?` の振舞いに影響を与えます。

```ruby
String.new.acts_like? :string  # => true
```

Conversions
--------------------------------------------------------------------------------

文字列を別のオブジェクトに変換するメソッドが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/conversions'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/conversions.rb)

### #to_time

* to_time(form = :local)

文字列を日時へと変換します。パースエラーの場合はnilを返します。
また、文字列を引数formには :utc を渡すとUTCを返します。

### #to_date

日付に変更へと変換します。 `Date.parse` に丸投げです。

### #to_datetime

文字列を日時へと変換します。 `DateTime.parse` へ丸投げです。


Encoding
--------------------------------------------------------------------------------

Deprecate なメソッドしか定義されていません。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/encoding'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/encoding.rb)

### #encoding_aware?

deprecate。現在は常に true を返します。

Exclude
--------------------------------------------------------------------------------

include? の逆の動作をする exclude? が実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/exclude'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/exclude.rb)

### #exclude?

* exclude?(string)

include? を呼びだして、否定をとる。include?の逆の動作をするだけのメソッドです。
引数string を含まない場合に true を返します。

Filters
--------------------------------------------------------------------------------

文字列のためのフィルタが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/filters'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/filters.rb)

### #squish

文字列の前後にある ホワイトスペース を削除して、文字の間にあるホワイトスペースをひとつにまとめます。

例:

```ruby
"   hoge \n \t goro   ".squish # => "hoge goro"
```

### #squish!

String#squish の破壊的バージョンです。

### #truncate

* truncate(truncate_at, options = {})

長い文字列を短くするメソッドです。短かくなった場合 '...' が後ろにつきます。
'...' を含めて文字列の長さが 引数truncate_at になるようにします。

options には :omission と :separator を指定することができます。

:omission は後ろにつける `...` を変えることができます。

:seprator は文字列を短くする際に区切りにする部分を指定します。引数trruncate_at に指定した部分より前で削除されます。

truncat_at が :omission より短い場合、バグがある。

```ruby
"hoge goro mogu".truncate 10  # => "hoge go..."
"hoge goro mogu".truncate 10, omission: '..'  # => "hoge gor.."
"hoge goro mogu".truncate 10, separator: ' '  # => "hoge..."
"hoge goro mogu".truncate 10, separator: /o/   # => "hoge g..."

# 削除されるものがない場合 :omission は付かない
"hoge goro mogu".truncate 20   # => "hoge goro mogu"
```

Indent
--------------------------------------------------------------------------------

文字列をインデントしてくれる indent メソッドが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/indent'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc2/activesupport/lib/active_support/core_ext/string/indent.rb)

### #indent

* indent(amount, indent_string=nil, indent_empty_lines=false)

### #indent!

```
def hoge
  puts
hoge
```

のような文字列を

```
  def hoge
    puts
  hoge
```

のようにインデントをつけることができるメソッド。

引数amount の量だけ 引数indent_string を前方に挿入します。
引数 indent_string はタブでインデントしてある文字列であればタブでインデントを行います。そうでない場合はデフォルトで スペースを利用します。
明示することで好きな文字を使うことができます。

引数 indent_empty_lines を true にすると空行もインデントを挿入できます。

* indent!(amount, indent_string=nil, indent_empty_lines=false)

`indent` メソッドの破壊的バージョン

Inflections
--------------------------------------------------------------------------------

単数形や複数形といった別の形へと文字列を変化させるメソッドが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/inflections'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/string/inflections.rb)

### #pluralize

* pluralize(count = nil, locale = :en)

文字列を複数形へ変化させます。引数count が1の場合は何もしません。
第2引数には locale が渡せますが、第1引数に シンボルを渡した場合は locale として認識します。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。

```ruby
'post'.pluralize  # => "posts"
```

### #singularize

* singularize(locale = :en)

`pluralize` の逆の動作をします。文字列を単数形へ変化させます。
引数に locale を渡すことができます。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。

```ruby
'posts'.singularize  # => "post"
```

### #constantize

文字列と同じ定数名の値を取得します。見つからない場合は 例外NameError が発生します。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。
```ruby
'Array'.constantize # => Array
Hoge = 1
'Hoge'.constantize  # => 1
```

### #safe_constantize

`constantize` メソッドの例外が発生しないバージョンです。見つからない場合は nil が返ります。

### #camelize

* camelize(first_letter = :upper)

キャメライズします。単語の切れ目を大文字にします。
引数の first_letter で先頭の文字を大文字にするか小文字にするかが決まります。
:upper か :lower が指定できて、それ以外の場合は nil を返すので注意してください。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。

`/` を含む場合は `::` で区切られます。クラス名を推測するのに役立ちます。

camelcase という別名があります。

```ruby
'active_record'.camelize                # => "ActiveRecord"
'active_record'.camelize(:lower)        # => "activeRecord"
'active_record/errors'.camelize         # => "ActiveRecord::Errors"
'active_record/errors'.camelize(:lower) # => "activeRecord::Errors"
'active_record/errors'.camelize(:hoge)  # => nil
```

### #titleize

文字列をタイトルに的した文字列に変換します。
基本的には単語の先頭が大文字になります。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。
titlecase という別名があります。

```ruby
'hoge goro mogu'.titleize  # => "Hoge Goro Mogu"
```

### #underscore

camelize の逆の動作をします。フォームなどに使用されています。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。

```ruby
'ActiveModel'.underscore         # => "active_model"
'ActiveModel::Errors'.underscore # => "active_model/errors"
```

### #dasherize

`_` を `-` に置き換えます。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。

```ruby
'hoge_goro'.dasherize  # => "hoge-goro"
```

### #deconstantize

定数名の最も右側を取り除きます。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。

```ruby
"Hoge::Goro".deconstantize  # => "Hoge"
"::Hoge::Goro".deconstantize # => "::Hoge"
"Hoge".deconstantize # => ""
"".deconstantize # => ""
```

### #parameterize

* parameterize(sep = '-')

文字列をURLで使える文字列へと変換します。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。

```ruby
"hoge goro mogu".parameterize # => hoge-goro-mogu
```


### #tableize

文字列をデータベースのテーブル名へ変換します。
アンダスコア化して複数形にします。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。

### #classify

テーブル名からクラス名の文字列へ変換します。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。
### #humanize

人間が読みやすい形に変換します。
先頭を大文字にしたり id を取り除いたりします。
実際の処理は[ActiveSupport::Inflector](/active_support/inflector/)で行なわれます。

```ruby
"hoge goro".humanize  # => "Hoge goro"
"hoge_id".humanize    # => "Hoge"
```

### #foreign_key

* foreign_key(separate_class_name_and_id_with_underscore = true)

文字列を外部キー用の名前に変換します。
引数separate_class_name_and_id_with_underscore を falseに指定するとid をアンダースコアで繋ぎません。

```ruby
"hoge".foreign_key       # => "hoge_id"
"hoge".foreign_key false # => "hoge_id"
"Goro::hoge".foreign_key # => "hoge_id"
```

Inquiry
--------------------------------------------------------------------------------

問い合せ可能な文字列を生成する String#inquiry メソッドが実装されています。
このメソッドが返す文字列は [ActiveSupport::StringInquiry](/active_supprt/string_inquiry/) のインスタンスで、Rails.env に代入されている文字列はこの文字列です。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/inquiry'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/string/inquiry.rb)

### #inquiry

[ActiveSupport::StringInquiry](/active_supprt/string_inquiry/) に変換したオブジェクトを返します。

この文字列は文字列に ? をつけたメソッドが true を返します。

例

```ruby
'hoge'.inquiry.hoge? # => true
'hoge'.inquiry.mogu? # => false
```

Multibyte
--------------------------------------------------------------------------------

マルチバイトな文字列のためのメソッドが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/multibyte'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/string/multibyte.rb)


### #mb_chars

Stirngのメソッドを Unicode セーフに使えるようにした `ActiveSupport::Multibyte::Chars` を作成する。
ActiveSupport::Multibyteを読んでいないのでまだよくわかってない。

### is_utf8?

エンコーディングがutf8 のときはもちろん、utf8 として使えるエンコーディングであれば true を返す

Output Safety
--------------------------------------------------------------------------------

テンプレートエンジン のために html_escape json_escape が実装されています。

また、html_escapeされた文字列に変換する String#html_safe メソッドが実装されています。
このメソッドは ActiveSupport::SafeBuffer クラスのインスタンスを返します。
このクラスはStringを継承していてほとんど文字列のように振舞います。html safe かどうかのフラグが追加されています。

また、escapeされた文字なのか区別がつくように Objectクラスに html_safe? メソッドが追加されています。
html_safe? が true を返すのは Numeric か ActiveSupport::SafeBuffer のインスタンスの場合のみのようです。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/output_safety'
```


### ERB::Util#html_escape

* html_escape(s)

引数s を HTMLのためにescapeします。具体的には `&` `>` `<` `"` `'` を置きかえます。
すでに html_safe? が true を返すオブジェクトに対しては何もしません。
必ず html_safe な文字列を返します。

h というエイリアスがあり、モジュールメソッドとしても使えます。

```ruby
ERB::Util.html_escape "<hoge>" # => "&lt;hoge&gt;"
```

### ERB::Util#html_escape_once

* html_escape_once(s)

引数s を HTMLのために escapeします。すでに escape したあとのようなものを含む場合は、escapeしないでくれます。

```ruby
ERB::Util.html_escape "&lt;hoge>"      # => "&amp;lt;hoge&gt;"
ERB::Util.html_escape_once "&lt;hoge>" # => "&lt;hoge&gt;"
```

& が escape されずに済んでいます。

### json_escape(s)

引数s を JSONのためにescapeします。具体的には `&` `>` `<` を置きかえます。

モジュールメソッドとしても使えます。

### Object#html_safe?

escapeされた文字かどうか確認します。
必ず `false` を返します。 true を返すようなオブジェクトを作成したい場合はオーバライドするようです。

### Numeric#html_safe?

escapeされた文字かどうか確認します。
必ず `true` を返します。

### ActiveSupprt::SafeBuffer

一度 ActiveSupport::SafeBuffer と変化した文字列は基本的には String には戻りません。
Stringをレシーバとするメソッドの引数に使用したり、`to_str` メソッドを呼びだすと String クラスのオブジェクトを返す場合もあります。
また、一部のメソッドを使用すると、html_safe? が false を返すようになります。

String#concat はオーバライドされていて、 original_concat にリネームされています。

#### SafeConcatError

`safe_concat` メソッドを使用した場合にに発生する可能性がある例外です。

#### #[]

* [](*args)

String[] とほぼ同等です。
引数をふたつ異常渡して、selfが unsafe な状態であれば文字列を返します。

#### #safe_concat

salf が html_safe でなくなっていれば、例外が発生する concat です

#### #initialize

* initialize(*)

インスタンス変数 @html_safe を true する処理が追加されています。

#### #initialize_copy

* initialize_copy(other)

インスタンス変数 @html_safe を true する処理が追加されています。

#### #clone_empty

空の文字列を作成します。

#### #concat

* concat(value)

引数value が html_safe でない場合、自動的に html_escape します。

#### #+

* +(other)

非破壊的な concat です。

#### #%

* +(other)

フォーマットしますが、concat 同様 引数other が html_safe でない場合、自動的に html_escape します。

#### #html_safe?

html_safe かどうか確認します。
呼んだメソッド次第は false を返す場合もあります。

#### #to_s

self を返します。

#### #to_param

to_str した文字列を替えします。

#### #encode_with

* encode_with(coder)

引数 coder の represent_scalar メソッドを呼びます。

#### unsafe_method

利用するとhtml_safe? が false になるメソッドです。

* capitalize
* chomp
* chop
* delete
* downcase
* gsub
* lstrip
* next
* reverse
* rstrip
* slice
* squeeze
* strip
* sub
* succ
* swapcase
* tr
* tr_s
* upcase
* prepend

### String#html_safe

文字列を html_safe にするメソッドです。 escapeされないので、そのままの文字列を利用したい場合に利用します。

Starts Ends With
--------------------------------------------------------------------------------

`starts_with?` と `ends_with?` メソッドが実装されています。
このメソッドは `start_with?` と `ends_with?` のエイリアスです。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/starts_ends_with'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/string/starts_ends_with.rb)

### #starts_with?

* start_with?([prefix])

`start_with?` のエイリアスです。
prefix がレシーバの先頭と一致するかどうかを確認します。

### #ends_with?

* end_with?([suffix])

`end_with?` のエイリアスです。
suffix がレシーバの末尾と一致するかどうかを確認します。

Strip
--------------------------------------------------------------------------------

インデントを取り除く `strip_heredoc` メソッドが実装されています。ヒアドキュメントを使って作成した文字列に使うと便利です。

この機能だけ利用する方法

```ruby
require 'active_support/core_ext/string/strip'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/string/strip.rb)

### #strip_hearedoc

インデントを取り除きます。
ヒアドキュメントを使うコードをみやすくできます。
`<<-` のヒアドキュメントは終了を示すラベルの先頭に空白があっても認識します。
この書き方の場合、普通のコードと同じインデントになりよみやすいです。

```ruby
def hoge
  <<-STRING
    I can't speak Engilsh.
    I can speak Japanese.
  STRING
end

puts hoge
#    I can't speak Engilsh.
#    I can speak Japanese.

puts hoge.strip_heredoc
#I can't speak Engilsh.
#I can speak Japanese.
```

このメソッドを使わない場合は


```ruby
def hoge
  <<STRING
I can't speak Engilsh.
I can speak Japanese.
STRING
end
```

のようになるでしょう。

Zones
--------------------------------------------------------------------------------

タイムゾーン情報を含んだ時刻オブジェクトへの変換する `in_time_zone` メソッドが実装されています。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/string/zones'
```

### #in_time_zone

* in_time_zone(zone = ::Time.zone)

文字列をタイムゾーンを含んだ時刻へ変換します。
デフォルトと タイムゾーンが設定していない場合は、文字列を単に `to_time` します。

* [::Time.zone](/active_support/core_ext/time/)

しかし、文字列に to_time を実装しているのは conversions.rb なのでこれを読み込みしておく必要があるような気がする。

`require 'active_support/core_ext/string/conversions'` をしておけないか確認する


```ruby
"12:00".in_time_zone "Tokyo"       # => Fri, 05 Jul 2013 12:00:00 JST +09:00
"12:00".in_time_zone "London"      # => Thu, 04 Jul 2013 12:00:00 BST +01:00

require 'active_support/core_ext/string/conversions'
"12.00".in_time_zone
```
