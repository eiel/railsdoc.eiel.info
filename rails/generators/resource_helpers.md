---
title: Rails::Generators::ResourceHelper
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/resource_helpers.rb)

model_nameを指定するオプションが追加されコントローラ名などを生成器するヘルパー。使用しているORMapperからジェネータを探すorm_classメソッドもある。
みつからない場合はRails::Generators::ActiveModelを選択する。
