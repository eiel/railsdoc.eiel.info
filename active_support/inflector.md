---
title: ActiveSupport::Inflector
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

言葉の変化に関連した機能を追加できます。

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflector.rb)


ActiveSupport::inflector
--------------------------------------------------------------------------------

基本的な変換機能を備えた Inflections クラスとファクトリ `.inflections` メソッドが定義されている。

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflector/inflections.rb#L9-L155)

### .inflections

* inflections(locale = :en)

`ActvieSupport::Inflectors::Inflections` のインスタンスを作り返す。
locale別にキャッシュされる仕組みなのでこれを経由することで無駄なインスタンスを生成しなくてすみます。
ブロックを渡すことで引数に インスタンスを渡してくれるので設定したい場合などにも利用できます。


ActiveSupport::Inflectors::Inflections
--------------------------------------------------------------------------------

特殊な処理が必要な単語を記録しておき、そうでないは定型処理をする仕組みになっていて、このデータベースの役割をして、そういた単語を登録したりして利用する。登録できる項目は、省略形、複数形、単数形、不可算名刺、人間のよみやすい形式への変換といった項目を追加することになります。

実際に変換する場合は `ActiveSupprt::Inflectors::Methods` のメソッドを使うことになる。

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflector/inflections.rb#L9-L193)

### #acronym

頭文字である単語を登録する。変換した時に大文字が維持される。

```ruby
require 'active_support/inflector'


include ActiveSupport::Inflector

inflections do |inf|
  p titleize "HTML"      # => "Html"

  inf.acronym "HTML"

  p titleize "HTML"      # => "HTML"
end
```

### #plural

* plural(rule, replacement

複数形の登録を行います。

### #singular

* singular(rule, replacement)

単数形の登録を行います。

### #irregular

* irregular(singular, plural)

複数形が people のような person といった特殊な単語を登録します。

### #uncountable

* uncountabel(*worlds)

money や infomation のような数えられない単語を登録します。

### #human

* human(rule, replacement)

人間によみやすくなるように変換するものを登録します。引数 rule には正規表現を登録可能です。

### #clear

* clear(scope = :all)

データベースを空にします。
scope に@なしのインスタンス名をわたすとそれに対応したものを空にします。


Methods
--------------------------------------------------------------------------------

文字列を別の種類の形に変換するメソッドが実装されています。
ActiveSupport::Inflector::Inflections に登録したデータを利用して変換するものもあります。
メソッドは ActiveSupport::Inflector のモジュールメソッドとして追加されます。
これらのメソッドは String のインスタンスメソッドからもアクセスできます。

この機能のみ利用したい場合は:

```ruby
require 'active_support/inflector/methods'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/inflector/methods.rb)

### #pluralize

* pluralize(word, locale = :en)

複数形に変換します。特殊な単語は ActiveSupport::Inflector::Infelctinos のインスタンスに保存されています。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.pluralize "post"    # => "posts"
ActiveSupport::Inflector.pluralize "octopus" # => "octopi"
ActiveSupport::Inflector.pluralize "posts"   # => "posts"
```

### #singularize

* singularize(word, locale = :en)

単数形に変換します。特殊な単語は ActiveSupport::Inflector::Infelctinos のインスタンスに保存されています。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.singularize "posts"  # => "post"
ActiveSupport::Inflector.singularize "octopi" # => "octopus"
ActiveSupport::Inflector.singularize "post"   # => "post"
```

### #camelize

* camelize(term, uppercase_first_letter = true)

キャメル形式に変換します。第2引数 `uppercase_first_letter` に `false` を指定すると先頭だけ小文字にすることができます。
変換規則は Rails のクラスの命名規則に沿います。
逆の走査は undersocre ですが、必ずしも元の文字列にもどるとは限りません。

ActiveSupport::Inflector::Inflections の acronyms や acronym_regex によって変換規則を修正可能です。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.camelize "active_model"        # => "ActiveModel"
ActiveSupport::Inflector.camelize "active_model", false # => "activeModel"
ActiveSupport::Inflector.camelize "active_model/errors" # => "ActiveModel::Errors"
```

### #underscore

* underscore(camel_cased_word)

アンダースコア形式に変換します。Rails のファイル名規則に沿います。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.underscore "ActiveModel"         # => "active_model"
ActiveSupport::Inflector.underscore "ActiveModel::Errors" # => "active_model/errors"
```

### #humanize

* humanize(lower_case_and_underscored_word)

人間にやさしい形式に変換します。
先頭の文字を大文字にしたり、 _id を排除したりします。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.humanize "user_id"      # => "User"
ActiveSupport::Inflector.humanize "current_user" # => "Current user"
```

### #titleize

* titleize(word)

タイトル用の文字列に変換します。
基本的には単語の先頭が大文字になります。

```ruby
require 'active_support/inflector/methods'

 ActiveSupport::Inflector.titleize "current user" # => "Current User"
```

### #tableize

* tableize(class_name)

クラス名をテーブル名に変換します。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.tableize "CurrentUser" # => "current_users"
```

### #classify

* classify(table_name)

テーブル名をクラス名に変換します。
ドットが含まれいるとドットより前の単語は削除されます。
一般的にはデータベース名が含まれている状態だからです。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.classify "current_users"        # => "CurrentUser"
ActiveSupport::Inflector.classify "system.current_users" # => "CurrentUser"
```

### #dasherize

* dasherize(underscored_word)

under_score な文字列を dash に変更します。
`_` を `-` へ置換しているだけでした。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.dasherize "current_user" # => "current-user"
```

### demodulize

* demodulize

モジュール名を削除します。
クラス名の部分を削除する場合は `deconstantize` メソッドを使用します。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.demodulize "Admin::CurrentUser" # => "CurrentUser"
```

### #deconstantize

* deconstantize(path)

モジュール名を含めたクラス名のクラス名を削除します。
クラス名だけを残す場合は `demodulize' メソッドを使用します。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.deconstantize "Admin::CurrentUser" # => "Admin"
ActiveSupport::Inflector.deconstantize "CurrentUser" # => ""
ActiveSupport::Inflector.deconstantize "::CurrentUser" # => ""
```

### #foreign_key

* foreign_key(class_name, separate_class_name_and_id_with_underscore = true)

クラス名を外部キー名に変更します。
第2引数 `separate_class_name_and_id_with_underscore` を `false` 指定すると追記する id に underscore を付属させません。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.foreign_key "User"        # => "user_id"
ActiveSupport::Inflector.foreign_key "User", false # => "userid"
ActiveSupport::Inflector.foreign_key "Admin::User" # => "user_id"
```

### #constantize

* constantize(camel_cased_word)

文字列を実際の定数が指しているオブジェクトへ変換します。
存在しない定数を指定した場合は `NameError` が発生します。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.constantize "Module" # => Module
```

### #safe_constantize

* safe_constantize(camel_cased_word)

例外が発生しない constanitize です。みつからない定数の場合は nil を返します。

### #ordinal

数値から `1st`, `2nd` のような序数形式として接尾語として使う文字列を返します。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.ordinal(1)  # => "st"
ActiveSupport::Inflector.ordinal(2)  # => "nd"
ActiveSupport::Inflector.ordinal(3)  # => "rd"
```

### #ordinalize

数値から `1st`, `2nd`, `3rd` のような序数形式の文字列を返します。

```ruby
require 'active_support/inflector/methods'

ActiveSupport::Inflector.ordinalize(1)  # => "1st"
ActiveSupport::Inflector.ordinalize(2)  # => "2nd"
ActiveSupport::Inflector.ordinalize(3)  # => "3rd"
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/inflector/methods.rb#L277-L299)
