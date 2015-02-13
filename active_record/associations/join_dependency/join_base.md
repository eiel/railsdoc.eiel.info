---
title: ActiveRecord::Associations::JoinDpendency::JoinBase
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activerecord/lib/active_record/associations/join_dependency/join_base.rb)

JoinPartをBaseにしているクラスもとにtableとailas_table_nameを取得できるようにしたもの。
