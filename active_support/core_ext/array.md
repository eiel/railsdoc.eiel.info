---
title: Core Ext Array
---
ActiveSupport 拡張で追加される Array のメソッドの紹介
--------------------------------------------------------------------------------

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

Access
================================================================================

配列内の要素へのアクセス方法を拡張する

この機能のみ読み込みたい場合は:

```ruby
require 'active_support/core_ext/array/access'
```

[ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/array/access.rb)

### #from

* from(position)

`position` 番目以降の配列を返す。
`array[position..-1]` と書くのとほぼ同じ。
違う点は返す値がない場合でも  `[]` 返す。

```ruby
%w( a b c d ).from(0)  # => ["a", "b", "c", "d"]
%w( a b c d ).from(2)  # => ["c", "d"]
%w( a b c d ).from(10) # => []
%w().from(0)           # => []
```

### #to

* to(position)

`position` 番目までの配列を返す。
`array[0..(position-1)]` と書くのとほぼ同じ。
`from` と同様に返す値がない場合でも `[]` を返す。

```ruby
%w( a b c d ).to(0)  # => ["a"]
%w( a b c d ).to(2)  # => ["a", "b", "c"]
%w( a b c d ).to(10) # => ["a", "b", "c", "d"]
%w().to(0)           # => []
```

### #second

* second

配列の2番目の要素を返す。
`first` メソッドとの対応付け。
`array[1]` と書くのと等価。

```ruby
%w( a b c d e ).second # => "b"
```

### #third

* third

配列の3番目の要素を返す。
`second` メソッドとの対応付け。
`array[2]` と書くのと等価。

```ruby
%w( a b c d e ).third # => "c"
```

### #fourth

* fourth

配列の4番目の要素を返す。
`third` メソッドとの対応付け。
`array[3]` と書くのと等価。

```ruby
%w( a b c d e ).fourth # => "d"
```

### #fifth

* fifth

配列の5番目の要素を返す。
`fourth` メソッドとの対応付け。
`array[4]` と書くのと等価。

```ruby
%w( a b c d e ).fifth # => "e"
```

### #forty_two

* forty_two

突然の `42` !!
たぶん、ネタメソッド。
[42](http://ja.wikipedia.org/wiki/42) は [生命、宇宙、そして万物についての究極の疑問の答え](http://ja.wikipedia.org/wiki/%E7%94%9F%E5%91%BD%E3%80%81%E5%AE%87%E5%AE%99%E3%80%81%E3%81%9D%E3%81%97%E3%81%A6%E4%B8%87%E7%89%A9%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6%E3%81%AE%E7%A9%B6%E6%A5%B5%E3%81%AE%E7%96%91%E5%95%8F%E3%81%AE%E7%AD%94%E3%81%88)。

`array[41]` と書くのと等価。

参考: [forty_two - what does it do?](http://stackoverflow.com/questions/8595899/forty-two-what-does-it-do)


Conversions
================================================================================

配列を別の形式へ変換するメソッドを定義している。

この機能のみ読み込みたい場合は:

```ruby
require 'active_support/core_ext/array/conversion'
```

[ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/array/conversions.rb)

### #to_sentence

* to_sentence(options = {})

配列をカンマで区切って、最後を and で繋ぐ文章へ変換する機能を提供する。
`array.join(',')` では余りに機械的すぎる場合によさそう。
Rails環境で、`i18n` に対応していれば、日本語化なども可能。

オプションを指定することで、振舞いを変更できる。無効なオプションを指定すると

```ruby
[].to_sentence                      # => ""
['one'].to_sentence                 # => "one"
['one', 'two'].to_sentence          # => "one and two"
['one', 'two', 'three'].to_sentence # => "one, two, and three"
```

#### オプション

* `:words_connector` 単語を区切り文字。デフォルトは `","`
* `:two__words_connector` 配列がふたつのときの区切り文字。
  デフォルトは `" and "`
* `:last_word_connector` 最後の要素との区切り文字。
  デフォルトは `", and "`
* `:locale` `i18n`が利用可能であれば ロケールの指定が可能。`support.array` 名前空間でオプションの指定をする。

```ruby
%W[親 子].to_sentence(two_words_connector: 'と')
# => "親と子"
%W[親 子 孫].to_sentence(words_connector: '、', last_word_connector: 'と')
# => "親、子と孫"
```

localeを使用する場合はこんな感じ:
```yaml
ja:
  support:
    array:
      words_connector: "、"
      two_words_connector: "と"
      last_word_connector: "と"
```

#### コードリーディングメモ

* `Array#assert_valid_keys` メソッドで、無効なオプションチェックをしている。便利そう。
* `i18n`が使えるかの判断は `defined?(I18n)` で、している。
* `i18n`を使う場合はデフォルトのオプションを上書きする。
* 引数がひとつのときは `dup` して終了
* 引数がふたつのときは `:two_words_connector` を使用する。
* 引数がみっつ以上で、 `:words_connector` で join して、最後だけ `:last_word_connector` でくっつける。


### #to_formatted_s

rdoc に書かれている通りに動作しない。要調査 [TODO]

* to_formatted_s(format = :default)

`to_s` のフォーマット済みの文字列を返すバージョン。
配列をフォーマットされた文字列へ変換する文字列。
配列の要素には`to_s`メソッドを使って文字列の変換を行う。

引数 `format` に `:db` を指定すると動作が変わり、 id をカンマでつないだ文字列を返す。

```ruby
class Blog
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def to_s
   "#{id} post"
  end
end

blogs = (1..3).map { |n| Blog.new(n) }
blogs.map(&:to_s) # => ["1 post", "2 post", "3 post"]

blogs.to_formatted_s # => 期待どおりうごかなかった
blogs.to_formatted_s :db # => "1,2,3"
```

また `Array#to_s` は `Array#to_default_s` へ エイリアスされ、`Array#to_s` も `Array#formatted_s` と同じ動作になる。

### #to_xml

* to_xml(options = {})


配列を xml に変換する。

```ruby
['hoge'].to_xml
# <?xml version="1.0" encoding="UTF-8"?>
# <strings type="array">
#   <string>hoge</string>
# </strings>
```

Extract Options
================================================================================

追加オプションを楽に扱うための `extract_options!` を定義している

この機能だけ読み込みたい場合は:

```ruby
require 'active_support/core_ext/array/extract_options'
```

[ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/array/extract_options.rb)

### #extract_options!

`*args` みたいな引数を使っても簡単にオプションを取り出せる。

```ruby
def hoge(*args)
  options = args.extract_options!
  # aptions を使っていろいろする。
  options # 確認のため
end

hoge(1,2) # => {}
hoge(a: :b, b: :c) # => {:a => :b, :b => :c}
hoge(1, 2, a: :b) # => {:a => :b}
hoge(1, 2, {a: :b}, b: :c, c: :d) # => {:b=>:c, :c=>:d}
```

#### リーディングメモ

* 実装のために `Hash#extractable_options?` もこのファイルで実装されている


Grouping
================================================================================

グルーピングを行うメソッドが実装されている。

https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/array/grouping.rb

### #in_groups_of

* in_groups_of(number, fill_with = nil)

`number` 個づつにグループ化する。足りない要素は fill_with で埋められます。

```ruby
(1..10).to_a.in_groups_of(3, 0)
# => [[1, 2, 3],
#     [4, 5, 6],
#     [7, 8, 9],
#     [10, 0, 0]]
```

サンプルは3個づつの配列が4つできています。

ブロックを渡すこともできます。

`fill_with` に false を渡すと、足りない要素は埋められません。

```ruby
(1..10).to_a.in_groups_of(3, false)
# => [[1, 2, 3],
#     [4, 5, 6],
#     [7, 8, 9],
#     [10]]
```

### #in_groups

* in_groups(number, fill_with = nil)

`number`個のグループになるように分けます。
足りない要素は `fill_with` で埋められます。

```ruby
(1..10).to_a.in_groups(3, 0)
# => [[1, 2, 3, 4],
#     [5, 6, 7, 0],
#     [8, 9, 10, 0]]
```

`in_groups_of` と同様に `fill_with` に false を渡すことで、足りない要素は埋めません。

### #split

* split(value = nil, &block)

String#split と同様の動作をします。`value` に渡した値ごとに配列を区切ります。

```ruby
[1,2,3,4,3,5].split(3) # => [[1, 2], [4], [5]]
```

ブロックも渡せます。

```ruby
(1..10).to_a.split { |n| n % 3 == 0 } # => [[1, 2], [4, 5], [7, 8], [10]]
```

引数もブロックも渡すとやや変態。このような使い方をする機会もなさそう。
```ruby
(1..10).to_a.split(2) { |n| n % 3 == 0 } # => [[1], [], [4, 5], [7, 8], [10]]
```

Prepend and Append
================================================================================

後ろに追加する `append` と 前に追加する `prepend` が実装されています。

この機能のみ読み込みたい場合は:

```ruby
requre 'active_support/core_ext/array/prepend_and_append'
```

[ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/array/prepend_and_append.rb)

### #append

`<<` のエイリアス。
最後尾に追加する。

```ruby
[1,2,3].append nil # => [1, 2, 3, nil]
```

### #prepend

`unshift` のエイリアス。
先頭に追加する。

```ruby
[1,2,3].prepend nil # => [nil, 1, 2, 3]
```

Uniq by
================================================================================

廃止予定のファイル。 配列をユニークする uniq_by が実装されていますが、 Array#uniq に委譲するだけになってます。

[ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/array/uniq_by.rb)

### #uniq_by

Array#uniq を使いましょう。

### #uniq_by!

Array#uniq! を使いましょう。

### コードリーディングメモ

* `ActiveSupport::Deprecation.warn` が Deprecation の通知に便利

Wrap
================================================================================

Arrayのクラスメソッド wrap が実装されています。

この機能のみ読み込みたい場合は:
```ruby
require 'active_support/core_ext/array/wrap'
```

[ソースコード](https://github.com/rails/rails/blob/v4.0.0.beta1/activesupport/lib/active_support/core_ext/array/wrap.rb)

### .wrap

このメソッドは配列であればそのまま、そうでなければ配列に持ち上げます。

<small>モナドっぽい感じですが、単純に 分岐で処理しています。</small>

```ruby
Array.wrap(nil) # => []
Array.wrap(1) # => [1] [1]
Array.wrap([1,2,3]) # => [1,2,3]
```

`[1,2,3]` を渡した場合に [[1,2,3]] にならないのがポイントのようです。
