---
title: Rails::Generators::AssetsGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta2/railties/lib/rails/generators/rails/assets/assets_generator.rb)

`rails g assets` の中身。指定したjsとcssを作る。
coffeeやsassが使える場合はcoffeeやらscssやらを作る。
