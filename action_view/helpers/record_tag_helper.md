---
title: ActionView::Helpers::RecordTagHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/record_tag_helper.rb)

レコードを対象としたブロック要素を作成する div_for ヘルパーを提供する。
より汎用的な content_tag_for もある。

class や id は dom_class ヘルパーや dom_id ヘルパーによって生成される。
[AcitonView::RecordIdentifier](/action_view/record_identifier)に定義されている。
