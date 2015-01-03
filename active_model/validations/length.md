---
title: ActiveModel::Validations::Length
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validations/length.rb)

値の長さに関するバリデータ。:minimumや:maximumを使って指定することもできるが、:inをつかってRangeによる指定も可能。
:tokenizerを指定することで対象の値を分割することもできる。
