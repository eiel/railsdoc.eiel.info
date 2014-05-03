---
title: ActionView::Template::Error
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/template/error.rb)

View の中で使われる Error クラスが定義されてます。

* ActionViewError
* EncodingError
* MissingRequestError
* WrongEncodingError
* MissingTemplate


ActionView::MissingTemplate
--------------------------------------------------------------------------------

どこから探したのか、部分テンプレートなのか。そういう情報をもってる。


ActionVIew::Template::Error
--------------------------------------------------------------------------------

サブテンプレートがあればそのメッセージを取得したり、どこでエラーがおきたのか整理するための情報が構築したりしてくれる。
