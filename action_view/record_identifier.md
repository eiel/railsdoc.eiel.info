---
title: ActionView::RecordIdentifier
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/record_identifier.rb)

レコードからHTMLに使用する ID や CLASS ための文字列を生成する。

id を作る場合は 新規オブジェクトの場合 new が接頭辞としてつく。
