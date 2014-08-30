---
title: Rails::Commands::Application
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/commands/application.rb)

[rails/cli](/rails/cli/) からload され [Rails::Generators::AppGenerator](/rails/app/app_generator)を起動する。
アプリケーションの雛形を生成する。

[Rails::Commands::CommandsTasks](/rails/commands/commands_task) からも起動される。

起動する前に Rails::Generators::AppGenerator.exit_on_failure? が true に上書きされる。
失敗すると停止するようになる。
