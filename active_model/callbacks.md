---
title: ActiveModel::AttributeMethods
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/callbacks.rb)


define_model_callbacksを提供してコールバックを提供しやすくしています。ActiveRecordで提供されるコールバックより低レイヤ。

メタプログラミングされていてコードは少しよみづらいがコメントにどんなコードが生成されているのか書いてある。

callbacksを設定したbefore around afterなコールバックを提供できる。
