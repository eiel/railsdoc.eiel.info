---
title: ActiveRecord::Associations::Builder::BelongsTo
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activerecord/lib/active_record/associations/builder/belongs_to.rb)

多関連のActiveRecord::Reflectionを作成するビルダー。

追加のコールバックとして、以下がある。

* :before_add
* :after_add
* :before_remove
*:after_remove

追加オプションが同様にあります。

* :table_name
* :before_add
* :after_add
* :before_remove
* :after_remove
* :extend

`関連名_ids`というメソッドも追加される。
