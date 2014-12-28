---
title: ActiveModel::Validations::ConfirmationValidator
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validations/confirmation.rb)

確認用のフィールドが作れる。
`_confirmation`を付与した属性と比較して同じ値なら正常な値として認識される。

_confirmationを付与したメソッドは自動生成してくれる。
