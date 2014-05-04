---
title: ActionView::Template::Text
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/template/text.rb)

Textのテンプレートデータを管理してるクラス。たぶん、変数は展開済みで、render 後の文字列データを保持している。


似たようなものとして [ActionVIew::Template::HTML](action_view/template/text) がある。
