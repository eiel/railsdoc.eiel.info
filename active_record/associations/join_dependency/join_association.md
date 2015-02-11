---
title: ActiveRecord::Associations::JoinDpendency::JoinAssonication
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activerecord/lib/active_record/associations/join_dependency/join_association.rb)


[JoinPart](/active_record/associations/join_dependency/join_association)を継承している。

JoinPartはrefrectionの型しかもっていなかったが、こちらはrefrection自体を保持している。

JoinInformationを作成するのが主な仕事。joinするための情報を構築しているように見える。挫折した。
