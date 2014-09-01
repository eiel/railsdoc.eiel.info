---
title: Rails::Commands::BDConsole
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/commands/dbconsole.rb)

exec をつかって設定しているデータベースのコンソールを起動する。


--mode オプションは sqlite3 の場合に利用される。
また config/databes.yaml で設定できる項目もここをみればわかる。
