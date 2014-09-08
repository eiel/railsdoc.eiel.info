---
title: Rails::Console::App
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/console/app.rb)

rails c で使えるコマンドが実装されている。

Rails::Console::App
---

### app

* app(create=false)

[ActionDispatch::Integration::Session](/action_dispatch/testing/integration) のインスタンスを返す。
host は www.exmaple.com が設定される。

create を true に設定して呼び出すと再生成される。

### new_session

ActionDispatch::Integration::Session を作成する。

### reload!

[ActionDispatch::Reloader](/action_dispatch/reloader).cleanup! と prepare! を呼ぶ。
