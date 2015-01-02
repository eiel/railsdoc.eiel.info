---
title: ActiveModel::Validations::Inclusion
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validations/inclusion.rb)

[ExclusionValidator](/active_model/validations/exclusion)の逆で、inオプションに指定した範囲内の値であれば正常な値と判断されるバリデータ。
