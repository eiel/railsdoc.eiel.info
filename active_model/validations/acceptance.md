---
title: ActiveModel::Validations::Acceptance
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc3/activemodel/lib/active_model/validations/acceptance.rb)

チェックボックスにちゃんとチェックが入っているかどうかを確認するのに便利なバリデータ。
`:accept`に指定した値が入る場合は正常値として判断される。
