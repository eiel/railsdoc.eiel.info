---
title: Lazy Load Hooks
---

ActiveSupport による遅延読み込みフック
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

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/lazy_load_hooks.rb)

この機能を読み込みする方法

```ruby
require 'active_support/lazy_load_hooks'
```


`ActiveSupport.onload` というメソッドを提供します。
ライブラリの読み込み後に実行したいコードを登録する機能になります。
また、すでに読み込みした後であれば、そのコードは直ちに実行されます。

ライブラリがこの機能に対応するには `ActiveSupport.run_load_hooks` 呼び出しをする必要があります。

コンテキストは run_load_hooks の第2引数に指定したオブジェクトになります。
yield オプションがあると引数にオブジェクトが渡された状態になります。


例:

```ruby
require 'active_support/lazy_load_hooks'

# 例では :hoge というキーを使用して Lazy Load Hooks を利用します。
# ライブラリの名前を利用すると良さそうです。

ActiveSupport.on_load :hoge do
  puts 'start 1st on load'
  hoge
  puts 'end 1st on load'
end

class Hoge
  def self.hoge
    puts 'hogehoge'
  end
end
# :hoge ライブラリの読み込みが終了したとする

puts 'before run_load_hooks'
ActiveSupport.run_load_hooks :hoge, Hoge    # 第2引数は block を実行するコンテキストを指定できる
puts 'after run_load_hooks'

ActiveSupport.on_load :hoge do
  puts 'start 2nd on load'
  hoge
  puts 'end 2nd on load'
end
```

実行結果

```
before run_load_hooks
start 1st on load
hogehoge
end 1st on load
after run_load_hooks
start 2nd on load
hogehoge
end 2nd on load
```

before run_load_hooks が呼ばれてから、hook が起動されていることがわかります。

モジュールメソッド
--------------------------------------------------------------------------------

### .on_load

* on_load(name, options = {}, &block)

引数name は hookの名前になります。
すでに 引数name の `run_load_hooks` が実行されていれば直ちに 引数block を実行し、まだの場合は `run_load_hooks` が呼ばれるまで遅延します。

引数 options には yield を指定できます。
block の引数に `run_load_hooks` で指定した第2引数 base を渡します。
そうでない場合は `run_load_hooks` で指定した第2引数 base のコンテキストで ブロックを実行します。

### .execute_hook

* execute_hook(base, options, block)

プライベートメソッド的な扱いだと考えられます。
実際に hook を起動する部分になりますあう。

引数 base のコンテキストで 引数 block を実行します。

options には :yield が指定でき、その場合 引数base が 引数 block へと渡されます。


### .run_load_hooks

* run_load_hooks(name, base = Object)

`on_load` で登録した ブロックを実行します。base にはブロックを実行するコンテキストを指定します。
一般的には class や module を渡します。
