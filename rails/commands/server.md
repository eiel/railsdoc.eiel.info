---
title: Rails::Commands::Server
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/commands/server.rb)


Rails::Commands::Server は [Rails::Commands::CommnadsTask#server](/rails/commands/commands_task) で new されて ルートディレクトリを調整し、startされる。

-c で config.ru を指定できることを知った。

log_to_stdout メソッドで console にもログを配信するような機能がある。
daemonaize すると自動でオフになる。
