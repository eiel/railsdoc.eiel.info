---
title: ActiveSupport::Notifications::Fanout
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

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/notifications/fanout.rb)

`ActiveSupport::Notifications::Fanout` は [ActiveSupport::Notifications](/active_support/notifications) で利用する通知が発生した時の処理を行う通知先を保存、管理します。
`Fanout#start` メソッドで通知の実行計測など前準備を行ない、 `Fanout#finish`メソッドで登録された処理を行います。
`Fanout#subscribe` によって登録される処理内容と通知のキーになる名前は `ActiveSupport::Notifications::Subscribers` により 以下の3ついずれかにラップされ `Fanout` に保持されます。

* `ActiveSupport::Notifications::Fanout::Subscribers::Evented`
* `ActiveSupport::Notifications::Fanout::Subscribers::Timed`
* `ActiveSupport::Notifications::Fanout::Subscribers::AllMessages`

`Evented` は `start` メソッドと `finish` メソッドに応答可能なオブジェクトであればこの形になります。
処理を実装したクラスを作成してオブジェクトを渡すという方法になります。

`Timed` は `start` と `finish` の変わりに `call` メソッドがコールバックされます。
通常は Block を渡すのでよく使う形式はこちらになります。`Timed` は `Evented` を継承していて `start` メソッドと `finishe` メソッドを提供する形になります。
`AllMessages` はキーが指定されていない場合のクラスでどんな通知でも処理を行います。
`Evented` か `Timed` を内包しており処理を委譲します。

```ruby
require 'active_support/notifications/fanout'


fanout = ActiveSupport::Notifications::Fanout.new

# AllMessages を登録
fanout.subscribe(nil) { puts 'all message' }

fanout.listeners_for('hoge').map(&:class) # => [ActiveSupport::Notifications::Fanout::Subscribers::AllMessages]

fanout.start('hoge', 1, {})
fanout.finish('hoge', 1, {})
>> all message

fanout = ActiveSupport::Notifications::Fanout.new

fanout.subscribe('hoge') { puts 'timed' }
# name を指定してブロックだと Timed に
fanout.listeners_for('hoge').map(&:class) # => [ActiveSupport::Notifications::Fanout::Subscribers::Timed]
# 名前が違うので通知先がない
fanout.listeners_for('mogu').map(&:class) # => []

# ブロックでなくクラスを渡したい場合
class Hoge
  def start(name, id, payload)
  end

  def finish(name, id, payload)
  end
end

fanout = ActiveSupport::Notifications::Fanout.new

fanout.subscribe('hoge', Hoge.new)
fanout.listeners_for('hoge').map(&:class) # => [ActiveSupport::Notifications::Fanout::Subscribers::Evented]
```

ActiveSupport::Notifications::Fanout
--------------------------------------------------------------------------------

`Subscribers` を管理します。`Subscribers` を登録したり、
キー名にマッチする `Subscribers` を呼び出したりできます。
スレッドセーフに実装されています。

### #subscribe

* subscribe(pattern = nil, block = Proc.new)

引数pattern にマッチした時に実行する処理を、引数 block として登録します。
start や finish というメソッドに応答可能なオブジェクトでも構いません。

### #unsubscribe

* unsubscribe(subscriber)

登録した処理を登録解除します。

### #start

* start(name, id, payload)

引数`name` にマッチする登録された処理の `start`メソッドや`Timed`オブジェクト であれば時間の計測を開始します。
引数 id, payload は処理に渡されます。

### #finish

* finish(name, id, payload)

引数`name` にマッチする登録されて処理の実行をします。

### #publish

* publish(name, *args)

引数`name` にマッチする登録された処理を実行します。
`Event`の場合は `publish` メソッドを実装していないと無視されます。
引数が自由に渡せるのも finish とは違う点になります。

### #listeners_for

* listeners_for(name)

引数`name` にマッチするものを確認します。

### #listening?

* listening?(name)

引数`name` にマッチするものがひとつでもあるか確認します。

### #wait

特になにもしません。


ActiveSupport::Notifications::Fanout::Subscribers
--------------------------------------------------------------------------------

Fanout.subscribe で登録可能なオブジェクトを作成します。
作成されるオブジェクトの種類は以下の3つのいずれかです。

* `ActiveSupport::Notifications::Fanout::Subscribers::Evented`
* `ActiveSupport::Notifications::Fanout::Subscribers::Timed`
* `ActiveSupport::Notifications::Fanout::Subscribers::AllMessages`

これらのクラスは Subscribers と呼ぶのが良さそうです。
登録した処理を実行するものが Evented で start と finish メソッドがあればこのクラスになります。
時間を計測したい場合 Timed になります。
どんな通知でも反応するのが AllMessages です。

### .new

* (pattern, listener)

引数からSubscribers を返します。

ActiveSupport::Notifications::Fanout::Subscribers::Evented
--------------------------------------------------------------------------------

Subscribers のひとつです。
通知を受け取り処理をする単位です。

### #publish

* publish(name, *args)

コールバックされる関数です。 委譲先に publish メソッドがない場合はなにもしません。

### #start

* start(name, id, payload)

通知の前処理を呼び出します。

### #finish

* finish(name, id, payload)

通知のあと処理を呼び出します。

### #subscribed_to?

* subscribed_to?(name)

引数 name で呼び出さる処理か確認します。

### matches?

* matches?(subscriber_or_name)

unsubscribe する時に自分のことかどうか判断するために利用されます。

ActiveSupport::Notifications::Fanout::Subscribers::Timed
--------------------------------------------------------------------------------

Evented を継承して実装されている Subscribers です。
通知でブロックを登録した場合はこれになります。

### #publish

* publish(name, *args)
`finish`メソッドと同様に call を呼びますが、引数から開始時間や終了時間などがなくなっています。

### #start

* start(name, id, payload)

通知に登録されている場合の前処理です。
時間の計測を開始します。

### #finish

* finish(name, id, payload)

通知される場合の実質的な処理部分です。

ActiveSupport::Notifications::Fanout::Subscribers::AllMessages
--------------------------------------------------------------------------------

Fanout に subsucribeする際に パターンを指定しなかった場合、通知がおきるたびに実行されるようにできます。
これを表現する Subscribers です。

Evented か Timed をラップしていて、subscribe_to? が常に true を返すのが特徴です。

### #start

* start(name, id, payload)

前処理で、委譲しているオブジェクトに丸投げします。

### #finish

* finish(name, id, payload)

前処理で、委譲しているオブジェクトに丸投げします。

### #publish

* publish(name, *args)

処理を実行します。委譲しているオブジェクトに丸投げします。

### subscribed_to?

常に true を返します。
そのため通知があった場合は常に実行されます。

### matches?

`===` のエイリアスになっています。
