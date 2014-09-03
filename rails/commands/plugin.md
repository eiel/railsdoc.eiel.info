---
title: Rails::Commands::Plugin
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/commands/plugin.rb)


rails plugin コマンドの処理。
引数の処理をして [Rails::Generators::PluginGenerator.start](/rails/generators/plugin_generator) を起動する。
