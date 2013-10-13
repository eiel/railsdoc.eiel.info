---
title: ActiveSupport::OrderedHash
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'mi
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/tagged_logging.rb)

Logger のフォーマッターを改良し、タグ付け可能にする。
タグは `[タグ名]` の形式で出力される。

インスタンスの作成には

```ruby
logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
```

とします。ブロック内で一時的にタグを付与したい場合は `tagged` メソッドを使い、単にタグを付与したい場合は `push_tags` メソッドを利用します。
タグはスタックのように蓄積するので、タグをひとつだけ削除するには `pop_tags` を使用します。
まとめて削除したい場合は `clear_tags!` メソッドがあります。

```ruby
require 'active_support/core_ext/module/delegation'
require 'active_support/tagged_logging'

logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
logger.info 'hoge'
# output => hoge
logger.tagged('mogu') { logger.info 'hoge' }
# output => [mogu] hoge
logger.tagged('mogu','goro') { logger.info 'hoge' }
# output => [mogu] [goro] hoge

logger.push_tags('mogu')
logger.info 'hoge'
# output => [mogu] hoge
logger.pop_tags
logger.info 'hoge'
# output => hoge
```

ActiveSupport::TaggedLogging
--------------------------------------------------------------------------------

クラスではなくモジュール。`.new` メソッドにより 受けとったオブジェクトに extend することで Logger のインスタンスを拡張します。
`logger.formatter` にも機能拡張を行い、基本的にはそこへ delegate して動作する。タグの情報はスレッドローカルな変数へ保存される。

### .new

* new(logger)

引数 `logger` にフォーマットの指定をして、メソッドを追加する。

### #push_tags

タグを設定する。
formatter へ処理を委譲する。

`ActiveSupport::TaggedLogging::Formatter` に基本的な機能がある。

### #pop_tags

タグをひとつ捨てる。
formatter へ処理を委譲する。

`ActiveSupport::TaggedLogging::Formatter` に基本的な機能がある。

### #clear_tags!

タグをすべて破棄する。

formatter へ処理を委譲する。

`ActiveSupport::TaggedLogging::Formatter` に基本的な機能がある。

### #tagged

* tagged*tags)

tags を一時的にタグへ追加し渡されたブロックの処理を行う。

formatter へ実質処理を委譲している。

`ActiveSupport::TaggedLogging::Formatter` に基本的な機能がある。

### #flush

タグをすべて破棄して親クラスの動作に従う。

-
