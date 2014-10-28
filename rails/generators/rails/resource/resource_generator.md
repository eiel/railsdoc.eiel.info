title: Rails::Generators::ResourceGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta2/railties/lib/rails/generators/rails/resource/resource_generator.rb)

`rails g resource`の中身。
単数のリソースを作成する。

第1引数がリソース名でそれ以降は属性名がつづく。
ルーティングとモデルも一緒に生成される
