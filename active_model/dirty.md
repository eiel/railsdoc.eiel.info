---
title: ActiveModel::Dirty
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/dirty.rb)

属性が変更されたかどうかを確認できるようになるモジュール。

代入する前に 属性名_will_change! メソッドをよぶと元の状態を別に保存する。
