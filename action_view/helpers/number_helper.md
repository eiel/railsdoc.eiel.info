---
title: ActionView::Helpers::NumberHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/number_helper.rb)

ほとんどメソッドが ActiveSupport::NumberHelper のラッパーになっていて、Viewで使う用途用として処理が追加される構成になっている。

InvalidNumberError を投げたりするってのが一番の大きなポイントか。

number_to_human は積極的に使えそう。
