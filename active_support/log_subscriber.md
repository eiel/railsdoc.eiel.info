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

log へ出力するためのメソッドをもった Subscriber。[ActiveSupport::Subscriber](/active_support/subscriber) をベースに `error` や `info` といった logger へのアクセスを提供する他にもアタッチしたイベント内でエラーが起きた場合も Logger へ流してくれます。

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

ActiveSupport::LogSubscriber
--------------------------------------------------------------------------------

ActiveSupport::Subscriber を継承しています。
protected なメソッドとして info debug warn error fatal unknown color 用意されています。

### .logger

Rails.logger が用意されていればこれを使います。
ない場合は ActiveSupport::LogSubscriber.logger= を使って設定する必要があります。

### .log_subscribers

登録されている Subscriber の一覧を返します。

### .flush_all!

設定されてる logger を flush します。

### #logger

ActiveSupport::LogSubscriber.logger へアクセスします。

### #start

* start(name, id, payload)

logger が設定されていない場合はなにもしないようになっています。
設定されている場合は Subscriber と同じ動作をします。

### #finish

* finish(name, id, payload)

logger が設定されていない場合はなにもしないようになっています。
設定されている場合は Subscriber と同じ動作をします。
finish 内でエラーが起きた場合は log へ レベル error でエラー内容を書き込みします。
