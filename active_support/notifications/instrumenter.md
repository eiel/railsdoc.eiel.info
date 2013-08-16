---
title: ActiveSupport::Notifications::Instrumenter
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

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/notifications/instrumenter.rb)

Fanout のFacade のような役割を果す`instrument` メソッドをもつ。
`Activesupport::Notifications#insturument` はこのメソッドを利用する。
`Fanout` への呼び出しで利用するIDの生成も行う。
ブロックに渡した処理の例外は payload[:exception] に格納され伝搬される。

また、Notification の発生したイベントの記録、親子関係を保持するための `Activesupport::Notification::Event` クラスも実装されています。

Activesupport::Notifications::Insturument
--------------------------------------------------------------------------------

### #initialize

* initialize(notifier)

instrument をするためのオブジェクトを引数 notifierから受けとる。
このオブジェクトには start finishを呼びだす。
また、Notification を呼際に利用するユニークIDの作成も行う。

### #instrument

* instrument(name, payload={})

name と payload で subsciber への呼び出しを行う.
`start` し、渡されたブロックを処理し、`finish` を実行する。

### #start

`@notifier` へ処理を委譲する。

### #finish

`@notifier` へ処理を委譲する。

### id

ユニークなIDを保持していて、これを返します。

Activesupport::Notification::Event
--------------------------------------------------------------------------------

### #initialize

* initialize(name, start, ending, transaction_id, payload)

Notificetaion からコールバックされてくる値を保持するクラス。

### #duration

処理かかった時間を ms で返す

### #<<

* <<(event)

引数`event` を子イベントとして追加します。

### #parent_of?

* parent_of?(event)

引数`event` の親かどうか確認します。

### name

通知のキーを返します。

### time

処理の開始時間を返します。

### transaction_id

呼び出した Insturumenter の ユニークIDです。

### payload

付加的な情報を引数として値をまとめたものです。

### children

子イベントの一覧を替えします。

### end

処理の終了時刻を返します。
