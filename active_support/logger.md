---
title: ActiveSupport::Logger
---

Loggerの拡張 ActiveSupport::Logger
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

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/logger.rb)

ActiveSupport::Logger は Logger を継承し、[LoggerSilence](/active_support/logger_silence) を include して拡張されており、デフォルトのフォーマットが [ActiveSupport::SimpleFormat](#activesupportsimpleformat) を指定してある Logger です。
また、`ActiveSupport::Logger.broadcast` メソッドが定義されています。
これは複数のlogger にまとめメッセージを送る機能を備えています。

例:

```ruby
require 'active_support/logger'

logger1 = Logger.new(STDOUT)
logger2 = ActiveSupport::Logger.new(STDOUT)

logger1.extend ActiveSupport::Logger.broadcast(logger2)

logger1.info 'hogehoge'
```

出力:

```
hogehoge
I, [2013-07-26T00:56:03.475235 #96255]  INFO -- : hogehoge
```

broadcast は Logger のインスタンスをうけとり Module を作成します。
このモジュールを別の Logger に extend することで、extendoしたオブジェクトにログの書き込みを行なうことで、`logger1` と `logger2` の両方のLoggerを利用することができます。

モジュールメソッド
--------------------------------------------------------------------------------


### .broadcast

複数の Logger を利用している場合に、ひとつのLoggerにロギングさせると、すべてにロギングさせることができます。

モジュールを作成するのでオブジェクトに extend して使います。

ActiveSupport::SimpleFormat
--------------------------------------------------------------------------------

日付もログレベルも表示しない非常に単純なフォーマッタです。
文字列を渡せば、文字列を。オブジェクトを渡せば innspect の結果がログに記録されます。
