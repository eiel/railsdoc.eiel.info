---
title: Rails::TestUnit::Railtie
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/test_unit/railtie.rb)

TestUnitのための Railtie。
読み込みしてたときに Rake.pallication が定義されていて test用のタスクがあれば RAILS_ENV をtestにする仕組みがある。
