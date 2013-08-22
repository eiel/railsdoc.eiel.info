---
title: ActiveSupport::Benchmarkable
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

ブロック内の実行時間を測り、ログに出力する `benchmark` メソッドを提供します。
このモジュールを使用するには logger でロガーにアクセスできるようにしておく必要があります。

```ruby
require 'logger'
require 'active_support/benchmarkable'

def logger
  @logger ||= Logger.new $stdout
end

include ActiveSupport::Benchmarkable

benchmark 'sample benchmark', level: :info do
  sleep 1
end
# >> I, [2013-08-23T00:46:25.976475 #37748]  INFO -- : sample benchmark (1001.1ms)
```

Rails では テンプレードエンジンのレンダリング時間 や SQL の実行時間をログ出力に利用されているようです。

ActiveSupport::Benchmarkable
--------------------------------------------------------------------------------

`benchmark` メソッドのブロックを実行するのにかかった時間を logger を使って出力します。

### benchimark

* benchmark(message = "Benchmarking", options = {})

引数の options には `:level` と `:silence` が使用できます。
`:level` には log level を指定し、 `silence` は Bool を指定できます。
