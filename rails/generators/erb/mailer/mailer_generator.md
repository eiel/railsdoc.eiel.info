---
title: Rails::Generators::Erb
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/erb/mailer/mailer_generator.rb)

`rails g erb:mailer` の中身。
第1引数がコントローラの名前でそれ以降がアクション名。

`rails g erb:mailer con ac1 ac2` とすれば

* apps/view/con/ac1.text.erb
* apps/view/con/ac1.html.erb
* apps/view/con/ac2.text.erb
* apps/view/con/ac2.html.erb

が生成される。

[erb:controller](rails/generators/erb/controller/controller_generator)を継承してる。
