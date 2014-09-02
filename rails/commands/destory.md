---
title: Rails::Commands::Destroy
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/commands/destroy.rb)


[Rails::Generators.invoke](/rails/generators) を behavior: :revoke を指定して実行する。
generator は作成したものを削除する機能をもっているので :revoke を指定することその動作になる。
実行すべきジェネレータは名前から決定される。
