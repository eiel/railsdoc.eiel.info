---
title: ActionView::Helpers::OutputSafetyHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/output_safety_helper.rb)

ActionView::Helpers::OutputSafetyHelper
--------------------------------------------------------------------------------

### raw

* raw(stringish)

HtmlSafe な文字列をHTMLエスケープせずに出力するのを補助するヘルパー。

raw を使うとHTMLエスケープをせずに文字列をそのま出力される。

### safe_join

* safe_join(array, sep=$,)

HTMLエスケープしながらJoinできる。
