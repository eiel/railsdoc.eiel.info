---
title: ActiveSUpport::OptionMerger
---

試した環境

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'mi
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/option_merger.rb)

不要なメソッドは削除されている。
残るのは `__` ではじまるメソッド、`instance_eval`,`class`,`object_id` ではじまるメソッドです。
MethodMissing を利用して処理を行います。

インスタンスを作る際に 引数`context` に呼び出すべきメソッドを持つオブジェクトとデフォルトの `option` を渡しておき実際に呼ばれた際には設定した引数に merge して実行します。

```ruby
class Hoge
  def hoge(text, **options)
    text + "-" + options[:hoge].to_s
  end
end

require 'active_support/option_merger'

merger = ActiveSupport::OptionMerger.new(Hoge.new, hoge: 1)
merger.hoge('hoge')          # => hoge-1
merger.hoge('hoge',hoge: 2)  # => hoge-2
```
