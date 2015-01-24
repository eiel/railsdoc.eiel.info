---
title: ActiveModel::Railtie
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/railtie.rb)

テスト環境のときは`ActiveModel::SecurePassword.min_cost`がtrueになるのと eager_load_namespaces に ActiveModel が追加されているだけ。
