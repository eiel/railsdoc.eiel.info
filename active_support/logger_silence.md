---
title: Logger Silence
---

Logger を拡張する Logger Silence
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

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/logger_silence.rb)


Logger に `silcence` というメソッドを追加します。このメソッドに渡したブロック内で一時的にログレベルを変更します。
デフォルトでは ERROR より優先度が低い WARNIN INFO DEBUG のログを出力しなくなります。
これは `Logger#level` を `Logger::ERROR` と指定している状態になります。
`silence` メソッドの引数にログレベルを指定することで好きなレベルに指定できます。
クラス変数 `silencer` を `false` にすることでこの機能を無効にすることができます。

クラス変数

この機能を利用する方法例

```ruby
require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/logger_silence'
require 'logger'

class Logger
  include LoggerSilence
end

logger = Logger.new STDOUT

logger.debug '10 DEBUG LOG'
logger.info  '20 INFO  LOG'
logger.warn  '30 WARN  LOG'
logger.error '40 ERROR LOG'

puts

logger.silence do
  logger.debug '10 DEBUG SILENCE LOG'
  logger.info  '20 INFO  SILENCE LOG'
  logger.warn  '30 WARN  SILENCE LOG'
  logger.error '40 ERROR SILENCE LOG'
end

puts

Logger.silencer = false

logger.silence do
  logger.debug '10 DEBUG SILENCER LOG'
  logger.info  '20 INFO  SILENCER LOG'
  logger.warn  '30 WARN  SILENCER LOG'
  logger.error '40 ERROR SILENCER LOG'
end
```

出力は以下のようになります。

```
D, [2013-07-24T01:11:17.515399 #50606] DEBUG -- : 10 DEBUG LOG
I, [2013-07-24T01:11:17.515491 #50606]  INFO -- : 20 INFO  LOG
W, [2013-07-24T01:11:17.515530 #50606]  WARN -- : 30 WARN  LOG
E, [2013-07-24T01:11:17.515551 #50606] ERROR -- : 40 ERROR LOG

E, [2013-07-24T01:11:17.515574 #50606] ERROR -- : 40 ERROR SILENCE LOG

D, [2013-07-24T01:11:17.515595 #50606] DEBUG -- : 10 DEBUG SILENCER LOG
I, [2013-07-24T01:11:17.515612 #50606]  INFO -- : 20 INFO  SILENCER LOG
W, [2013-07-24T01:11:17.515630 #50606]  WARN -- : 30 WARN  SILENCER LOG
E, [2013-07-24T01:11:17.515647 #50606] ERROR -- : 40 ERROR SILENCE{ LOG
```

SILENCE のものだけ ERROR だけ表示されています。

モジュールメソッド
--------------------------------------------------------------------------------

### .silencer

クラス変数 silercer の値を取得します。

### .silencer=

* silencer=(value)

クラス変数 silencer の値を 引数 value で設定します。


インスタンスメソッド
--------------------------------------------------------------------------------

### #silence

* silence(temporary_level = Logger::ERROR, &block)

一時的に log_level を 引数 temporary_level に変更して block を実行します。
Logger.silencer を設定していると無効化することもできます。
