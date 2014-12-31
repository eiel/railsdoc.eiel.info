---
title: ActiveModel::Validations::Format
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validations/format.rb)

指定したフォーマットになっているかチェックするバリデータ。
:withか:withoutオプションを指定する。両方指定できない。

:withや:withoutには正規表現を指定する。
