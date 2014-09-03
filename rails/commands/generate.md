---
title: Rails::Commands::Generate
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/commands/generate.rb)


[Rails::Generators.invoke](/rails/generators) を behavior: :invoke を指定して実行する。
generate で作成したものは destroy で基本的には戻せるようになっている。
