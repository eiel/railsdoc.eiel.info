---
title: Core Ext Thread
---
ActiveSupport 拡張で追加される Thread のメソッド
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

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/thread.rb)

Thread
--------------------------------------------------------------------------------

スレッドにローカルな変数を提供しますが、
Ruby 2.0 以降であれば Ruby に実装されている機能を利用します。

この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/thread'
```

`Thread#locals` というプライベートメソッドが機能の中心になっています。
インスタンス変数 `@locals` を作成して、値を保存します。

各メソッドはこの `@locals` へのアクセッサになっている `locals` へアクセスして機能を提供していました。

```ruby
thread1 = Thread.new do
  Thread.current.thread_variable_set :hoge, 'hogehoge'
  Thread.current.thread_variable_get :hoge   # => 'hogehoge'
end

thread1.thread_variables  # => 'hoge'

thread2 = Thread.new do
  Thread.current.thread_variable_set :mogu, 'mogumogu'
end

thread1.thread_variables  # => [:hoge]
thread2.thread_variables  # => [:mogu]
```

Thread.current に書きこんでいますが、別のスレッドには影響ありません。

### #thread_variable_get

* thread_variable_get(key)

引数 `key` には、取得したい変数の名前を渡します。

### #thread_variable_set

* thread_variable_set(key,value)

引数 `key` には、値の保存先の変数名、引数 `value` には、保存したい値を渡します。

### #thread_variables

スレッドローカル変数の一覧を返します。

### #thread_varibale?

* thread_variable?(key)

引数 `key` のスレッドローカル変数が定義されているか確認します。
