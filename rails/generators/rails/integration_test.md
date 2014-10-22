---
title: Rails::Generators::IntegrationTest
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta2/railties/lib/rails/generators/rails/integration_test/USAGE)

`rails g integration_test`の中身。
integration というフックが用意されていて、ここでは特になにも実装されていない。
