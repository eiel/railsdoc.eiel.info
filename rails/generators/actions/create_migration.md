---
title: Rails::Generators::Actions::CreateMigration
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/actions/create_migration.rb)

マイグレーションファイルを作成するための Thor アクション。
作成には特別なことはしないが、削除する際の処理がいろいろある。
主にmigrationディレクトリ内のものを削除するかどうか。
