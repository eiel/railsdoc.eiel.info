---
title: ActiveSupport::Subscriber
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

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/subscriber.rb)

[AcitveSupport::Notifications](/active_support/notifications) は汎用的なので、より特殊な条件を加え使いやすくするような印象。
`ActiveSupport::Subscriber` を継承してメソッドを定義すると規約にそった通知に対応することができます。
これを有効にするには `ActiveSupport::Subscriber.attach_to` を使って登録します。
以下の例は `mogu.goro` という通知に反応できるようにします。

```ruby
require 'active_support/notifications'
require 'active_support/subscriber'

class Hoge < ActiveSupport::Subscriber
  # event には ActiveSupport::Notifications::Event のインスタンス
  # 'mogu.*' に対応する * の部分は attach_to で決まる。
  def mogu(event)
    puts 'mogu'
  end
end

# Hoge は `*.goro` に対応する * の部分はメソッドを定義しておけばいい。
Hoge.attach_to :goro
ActiveSupport::Notifications.instrument("mogu.goro")
# >> mogu
```

ActiveSupport::Subscriber
--------------------------------------------------------------------------------

### .attach_to

* attach_to(namespace, subscriber=new, notifier=ActiveSupport::Notifications)

`*.namespace` という Notification に処理するオブジェクトとして設定できる。
処理する側はインスタンスを作成する必要がない。独自のものを使いたい場合は指定することもできる。継承してメソッドを実装することでさまざまな Notification に対応できる。

### .subscribers

登録されている subscribers を確認できる

### #start

* start(name, id, payload)

登録された処理を行う前準を行なう。
`ActiveSupport::Notification` によって呼ばれる。

### #finish

* finish(name, id, payload)

finish だが 実際には処理が行われる。
コールバックされる event の準備をしてからメソッドを呼び出します。
`start`と`finish` のおかげで event 引数が構築される。ぐらいの認識でよさそう。
