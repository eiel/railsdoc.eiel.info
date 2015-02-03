---
title: ActiveRecord::Associations::Builder::HasAndBelongsToMany
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activerecord/lib/active_record/associations/builder/has_and_belongs_to_many.rb)

ActiveRecord::Associations::Builder::HasAndBelongsToMany::JoinTableResolver::KnownClass
---

ふたつのクラスを渡してjoin_table名をつくる。

ActiveRecord::Associations::Builder::HasAndBelongsToMany::JoinTableResolver
---

### .build

KnownClassのインスタンスか構造体のインスタンスを返す。どちらもjoin_tableを返す。


ActiveRecord::Associations::Builder::HasAndBelongsToMany
---

### #through_model

joinするモデルを動的に生成する。
ActiveRecordのインスタンス。

### middle_reflection

has_manyのリフレクションを作成する。


