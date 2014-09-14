---
title: Rails::Generators::GeneratedAttribute
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/generated_attribute.rb)

`rails g`で指定する`name:string`をパースしてinputフォームの種類を決めたりデフォルト値を決めたりしている。生成するためのヘルパーと考えてもよさそう。


indexを指定することもでき`name:type:index`のようになる。

typeには

* string
* integer
* float
* decmal
* time
* datetime
* timestamp
* text
* boolean

がある模様。

indexには

* uniq
* index

が指定できる。

