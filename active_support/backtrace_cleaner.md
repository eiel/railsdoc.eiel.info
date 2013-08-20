---
title: ActiveSupport::BacktraceCleaner
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

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/backtrace_cleaner.rb)

backtrace にフィルターをかけて整形したり、サイレンサーを使い部を非表示にしたりできます。
フィルターを試してみます。`add_filter` を使い登録し、`clean` にバックトレースを渡して使います。

```ruby
require 'active_support/backtrace_cleaner'

bc = ActiveSupport::BacktraceCleaner.new

def hoge(n)
  raise if n == 0
  hoge n-1
end

begin
  hoge 3
rescue => e
  bc.clean(e.backtrace) # => ["(pry):47:in `hoge'", "(pry):48:in `hoge'", "(pry):48:in `hoge'", "(pry):48:in `hoge'"]
end

bc.add_filter { |line|  line.gsub("pry","^-^") }
begin
  hoge 3
rescue => e
  bc.clean(e.backtrace) # => "(^-^):47:in `hoge'",  "(^-^):48:in `hoge'",  "(^-^):48:in `hoge'"]
end
```

サイレンサを使うと特定行を非表示にできます。
サイレンサの設定には `add_silencer` を利用します。

```ruby
require 'active_support/backtrace_cleaner'

bc = ActiveSupport::BacktraceCleaner.new

def hoge(n)
  mogu if n == 0
  hoge n-1
end

def mogu
  raise
end

begin
  hoge 3
rescue => e
  bc.clean( e.backtrace ) # => ["(pry):98:in `mogu'",  "(pry):94:in `hoge'",  "(pry):95:in `hoge'",  "(pry):95:in `hoge'",  "(pry):95:in `hoge'",
end

bc.add_silencer { |line| line =~ /hoge/ }

begin
  hoge 3
rescue => e
  bc.clean( e.backtrace ) # => ["(pry):98:in `mogu'"]
  # 第2引数を省略すると :silence が利用されている
  # :noise を指定すると非表示と表示が入れ変わります
  bc.clean( e.backtrace, :noise) # => ["(pry):94:in `hoge'",  "(pry):95:in `hoge'",  "(pry):95:in `hoge'", "(pry):95:in `hoge'"]
  # 他の値を指定すると サイレンサは使用しません
  bc.clean( e.backtrace, :noise) # => ["(pry):98:in `mogu'","(pry):94:in `hoge'",  "(pry):95:in `hoge'",  "(pry):95:in `hoge'", "(pry):95:in `hoge'"]
end
```

ActiveSupport::BacktraceCleaner
--------------------------------------------------------------------------------

`add_filter` や `add_silence` でフィルタやサイレンサを登録しバックトレースを整理でます。
整理には `clean` メソッドを使います。
フィルタから処理されてサイレンサが処理されます。

### #clean

* clean(backtrace, kind = :silent)

第1引数に backtrace を渡します。
第2引数の kind で処理方法を変えられます。
:silent にした場合はサイレンサにマッチしたものは非表示になり、
:noise にした場合はサイレンサにマッチしたものを表示します。

別名として filter があります。

### #add_filter

* add_filter(&block)

引数block をフィルタとして登録します。
フィルタは行の変更に利用します。
ブロックは行ごとに実行され、行の戻り値を集めます。

### #add_silencer

* add_silencer(&block)

引数block をサイレンサとして登録します。
サインサは行の削除に利用します。
ブロックが true の場合は非表示に、false の場合は表示になります。
ただし、clean メソッドの第2引数によっては入れ替えます。

### #remove_silencers!

登録されているサイレンサをすべて削除します。

### #remove_filters!

登録されているフィルタをすべて削除します。
