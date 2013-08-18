---
title: ActiveSupport::LogSubscriber
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

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/log_subscriber.rb)

log へ出力するための helper をもった Subscriber。[ActiveSupport::Subscriber](/active_support/subscriber) をベースに `error` や `info` といった logger へのアクセスを提供する他にもアタッチしたイベント内でエラーが起きた場合も Logger へ流してくれます。

```ruby
require 'active_support/notifications'
require 'active_support/log_subscriber'
require 'logger'

ActiveSupport::LogSubscriber.logger = Logger.new(STDOUT)

class HogeSubscriber < ActiveSupport::LogSubscriber
  def mogu(event)
    error 'hogehoge'
    puts "mogumogu"
  end
end

HogeSubscriber.attach_to :goro
ActiveSupport::Notifications.instrument("mogu.goro")
# >> E, [2013-08-19T02:09:20.052915 #47744] ERROR -- : hogehoge
# >> mogumogu

class ErrorSubscriber < ActiveSupport::LogSubscriber
  def mogu(event)
    raise
  end
end

ErrorSubscriber.attach_to :hoge
ActiveSupport::Notifications.instrument("mogu.hoge")
# >> E, [2013-08-19T02:15:09.010773 #47744] ERROR -- : Could not log "mogu.hoge" event. RuntimeError: (以下略 コールスタックがつづく)
```
