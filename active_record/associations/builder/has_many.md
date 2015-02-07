---
title: ActiveRecord::Associations::Builder::HasMany
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activerecord/lib/active_record/associations/builder/has_many.rb)

CollectionAssociationにテーブル系のオプションが追加されただけみたい。

valid_optionsと.valid_dependent_optionsにそれぞれオプションが追加されています。
