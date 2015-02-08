---
title: ActiveRecord::Associations::JoinDpendency::JoinPart
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activerecord/lib/active_record/associations/join_dependency/join_part.rb)

難しい…。
Enamerableになっているが、コンストラクタでうけとるbask_klassとchildrenをまとめてまわす感じになる。

joinしている一部を表現するクラスみたいなことしかわからない。
