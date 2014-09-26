---
title: Rails::Generators::ModelHelper
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/model_helpers.rb)

force_pluralオプションを提供する。
名前は基本的に自動で単数形に変換されますが、このオプションを指定すると、複数形の名前を作ることができる模様。

モジュールなのでincludeして使う。
