---
title: Core Ext Benchmark
---

ActiveSupport 拡張で追加される Benchmark のメソッドの紹介
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

[Benchmark]() モジュールで以下のメソッドを追加する方法

```ruby
require 'active_support/core_ext/benchmark'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/benchmark.rb)

インスタンスメソッド
--------------------------------------------------------------------------------

### #ms

* ms(&block)

[Benchmark.realtime](http://rurema.clear-code.com/query:Benchmark.realtime/) の結果を ミリ秒で表示する `Benchmark.realtime` のラッパーです。

Benchmark.ms に ブロックを渡すとブロックを評価して実行時間を計測します。

```ruby
Benchmark.ms {  sleep 1 }       # => 1000.234
Benchmark.realtime {  sleep 1 } # => 1.001074
```

realtime だと 秒表示 ですが このメソッドを使うと ms表示になります。