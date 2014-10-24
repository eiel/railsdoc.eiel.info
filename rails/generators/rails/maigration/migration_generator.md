---
title: Rails::Generators::MigrationGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta2/railties/lib/rails/generators/rails/migration/migration_generator.rb)

`db/migrate` にファイルを作成するジェネレータ。第1引数から対応するテーブルをみつける機能があるみたいだけどどうなってるのかよくわからない。
`hook_for :orm`が関係してそう。
第2引数以降は`フィールド名:タイプ:インデックス`の形式で指定できる。
