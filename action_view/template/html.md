---
title: ActionView::Template::HTML
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/template/html.rb)

HTMLのテンプレートデータを管理してるクラス。たぶん、変数は展開済みで、render 後の文字列データを保持している。
to_str すると ERB::Util.h される。

似たようなものとして [ActionVIew::Template::Text](action_view/template/text) がある。
