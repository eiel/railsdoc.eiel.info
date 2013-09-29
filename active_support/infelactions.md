---
title: ActiveSupport::Inflector
---


試した環境

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

[ActiveSupport::Inflector::Inflections](/active_support/inflector/) のデータベースの構築をしている。

ここをみると

* person
* man
* child
* sex
* move
* zombie

がイレギュラーとして登録されていることや数えられないものとして

* equipment
* information
* rice
* money
* species
* series
* fish
* sheep
* jeans
* police

が設定されている。特殊なものを登録したい場合はこのあたりを真似していけばよい。
