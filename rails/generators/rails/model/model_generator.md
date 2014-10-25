---
title: Rails::Generators::ModelGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta2/railties/lib/rails/generators/rails/model/model_generator.rb)


`rails g model` の中身。
MigrationGeneratorと同様な構成になっていて、ほとんどの処理はO/Rマッパーに任せている。

第1引数にモデルの名前でそれ以降は `field:type:index` という形式で記述する。
typeには以下のものを指定できる。

* integer
* primary_key
* decimal
* float
* boolean
* binary
* string
* text
* date
* time
* datetime
