---
title: ActionView::Helpers::Tags::Base
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/tags/base.rb)

form_for を使ってフォームをつくる場合のタグを作成するクラスの共通処理がまとめられている。

Object を保持して オブジェクトの名前、値を作る時のメソッドからタグを生成する。
object は option もしくは コンストラクタ第3引数の template_object からとりだす。
template_object から取り出す場合は object_name を利用する。

value を生成するにはなぜか外部からobjectを渡すようになっている。柔軟性の問題なのだろうか。
`メソッド名_before_type_cast` というメソッドがあればそちらが優先される。

render メソッドは子クラスでオーバライドすることになっている。

name属性や id属性のための情報がない場合は生成する。
