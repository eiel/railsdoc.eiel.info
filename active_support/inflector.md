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

この機能のみ利用したい場合は:

```ruby
require 'active_support/inflector/methods'
```

とします。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/inflector/methods.rb)

### .ordinalize

数値から `1st`, `2nd`, `3rd` のような序数形式の文字列を返します。

```ruby
ActiveSupport::Inflector.ordinalize(1)  # => "1st"
ActiveSupport::Inflector.ordinalize(2)  # => "2nd"
ActiveSupport::Inflector.ordinalize(3)  # => "3rd"
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/inflector/methods.rb#L277-L299)
