---
title: ActiveRecord::Associations::Preloader
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activerecord/lib/active_record/attribute_methods/before_type_cast.rb)

* read_attribute_before_type_cast
* attributes_before_type_cast

メソッドを追加します。
ActiveRecordのオブジェクトを作ると渡した値は型変換が行なわれてしまいますが、型変換をする前の値を取り出したい場合に使うメソッドです。

`value_before_type_cast`をつかっているけどここでは定義されていない。
[ActiveREcord::Attribute](/active_record/attribute)のメソッド。
