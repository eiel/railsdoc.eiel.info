---
title: ActiveModel::Validations::Callbacks
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validations/callbacks.rb)

`before_validation`,`after_validation`といったvalidationにコールバックを追加する。

`before_validation`は値を修正するのに使いやすそう。

中身はオプションを組んで`set_callback`を読んでくれる。
