---
title: ActiveModel::FobiddenAttributesProtection
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/forbidden_attributes_protection.rb)

permit!されていない Controllerからのパラメータが来た場合にActiveModel::ForbiddenAttributesErrorという例外を投げる sanitize_for_mass_assignment メソッドを提供するモジュール。
