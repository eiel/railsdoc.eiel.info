---
title: ActiveSupport::Notifications
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

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/notifications.rb)

Rails 3 あたりからある機能。name をキーにした緩い依存関係を構築できる。
あとから機能追加できるようにする仕組みとも言える。
実行時間を計測する機能を持っているので、プロファイリングに利用されている。

キーに処理を登録しておき、キーのイベントを発生せると登録していた処理が実行されます。
処理を登録する側は正規表現を使うことで複数のイベントから通知を受けることもできます。
処理の登録には `ActiveSupport::Notifications.subscribe` を使います。
イベントの発生には `ActiveSupport::Notifications.instrument` を使います。
Rails では `config/initilaizers` で設定することで処理を追加できる。

例:

```ruby
require 'active_support/notifications'

# hoge.mogu というイベントが起きた時の処理を追加する
ActiveSupport::Notifications.subscribe('hoge.mogu') do |name, start, finish, id, payload|
  puts "#{name}: hoge mogu"
end

# 正規表現もOK
ActiveSupport::Notifications.subscribe(/mogu/) do |name, start, finish, id, payload|
  puts "#{name}: mogu"
end

ActiveSupport::Notifications.subscribe(/^hoge/) do |name, start, finish, id, payload|
  puts "#{name}: hoge"
end

# マッチしないやつ
ActiveSupport::Notifications.subscribe(/^moge/) do |name, start, finish, id, payload|
  puts "#{name}: mogu mogu"
end

# イベントを起こす
ActiveSupport::Notifications.instrument('hoge.mogu')

>> hoge.mogu: hoge mogu
>> hoge.mogu: mogu
>> hoge.mogu: hoge
```

`instrurment` メソッドは第2引数に `payload` を設定できます。
この値は `subscribe` メソッドの第5引数に渡されます。

通知する処理の管理には [ActiveSupport::Notifications::Fanout](/active_support/notifications/fanout) が使われています。
通知の処理は `ActiveSupport::Notifications::Instrumenter`が使われています。instrumenter はスレッドごとに生成されます。

ActiveSupport::Notifications
--------------------------------------------------------------------------------

ほとんどの処理は `ActiveSupport::Notifications::Fanout` や `ActiveSupport::Notifications::Instrumenter` に委譲されています。
詳しい動作を確認したいならそちらに。

### .notifier

通知先の管理を行うオブジェクトを返します。
デフォルトでは `ActiveSupport::Notifications::Fanout` のインスタンスです。


### .notifer=

* notifier=(notifier)

通知先の管理を行うオブジェクトを変更できます。

### .publish

* publish(name, *args)

引数 `name` のイベントが起きた場合に処理される処理を確認、取得できます。
処理は `notifer#publish` に丸投げします。

### .instrument

* instrument(name, payload = {})

引数 `name` のイベントを起こします。
イベントでフックされる処理には `payload` を渡すことができます。

ブロックを渡すことでブロックの開始時刻と終了時刻がフックされる処理ニ渡せます。

### .subscribe

* subscribe(*args, &block)

イベントが起きた時の処理を登録できます。
イベントの名前は第1引数に指定します。
正規表現を使うことで複数のイベントに対応できます。

### .subscribed

* subscribed(callback, *args, &block)

一時的にイベントが起きたときの処理を登録できます。
渡したブロックから脱出すると処理されなくなります。
処理は第1引数`callback` に登録します。

例

```ruby
require 'active_support/notifications'

callback = proc { puts 'hoge' }

ActiveSupport::Notifications.subscribed callback, 'hoge' do
  # callback は実行される
  ActiveSupport::Notifications.instrument('hoge')
end

# callback は登録解除されて呼ばれない
ActiveSupport::Notifications.instrument('hoge')

>> hoge
```

### unsubscribe

* unsubscribe(args)

登録した処理を解除します。
第1引数に解除したい`subscriber`を渡します。
これは `subscribe` した時の戻り値や `pushbilush` の戻り値から首都できます。
処理は `notifer#publish` に丸投げします。

### instrumenter

イベッントが起きたとき登録された処理を実行する `instrumenter` を返します。スレッドごとに違うオブジェクトを返します。
