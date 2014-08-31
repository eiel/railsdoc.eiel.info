---
title: Rails::Commands::Console
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/commands/console.rb)


rails c をしたときに実行されるのが Rails::Comands::Console.start で
引数でアプリケーションの設定を行い IRB.start を行う。

-s で sandbox 化することができるが app.sandbox を設定することで実現する。
また IRB 意外を利用したい場合は app.config.console を指定する。
