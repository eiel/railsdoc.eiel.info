---
title: Rails::Generators::ScaffoldGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/erb/scaffold/scaffold_generator.rb)

fieldとtypeを入力できてindex edit show new _form のviewを作成することのできるジェネレータ。
[Rails::Generators::ResourceHelpers](/rails/generators/resource_helpers/) を継承している
