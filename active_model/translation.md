---
title: ActiveModel::Translation
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/translation.rb)

`human_attribute_name`メソッドを提供する。

最終的にI18n.translateを呼ぶ。
第1引数の文字列とoptionsに`:count`と`:defaults`を生成する。

mogu.hoge.goroであれば

`active_model.attributes.mogu/hoge.goro` のような感じになるっぽい。

defaultsはキーに該当する値がなかった場合に使われるようで、継承している場合などにも対応しているみたい。
