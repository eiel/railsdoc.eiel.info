---
title: Rails::Commands::CommandsTasks
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/commands/commands_tasks.rb)


[rails/commands](/rails/commands)から起動される。
rails のコマンドを起動するクラス。

Rails::Commands::CommandsTasks
---

コマンドに対応するメソッドがあり rails/commands/ に対応したファイルがあり、どのコマンドもまずそれを読む。 new と help は rails/commands/application を読み込みする。

generato と destroy は表裏一体の実装になっていて、共通化のメソッド generate_or_destroy に引数を設定することでいれかえができる。

### #run_command!

コマンドごとにメソッドがあるので振り分けをする。

### console

[rails/commands/console](/rails/commands/console) を読み込みして、
[Rails::Console.start](rails/console) を起動する。

### server

Rails::Server のインスタンスを起動して APP_PATH を require し Server#start を実行する。

## dbconsole

[Rails::DBConsole.start](/rails/db_console) を実行する
