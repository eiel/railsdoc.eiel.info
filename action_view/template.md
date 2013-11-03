---
title: ActionView::Template
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/e20dd73df42d63b206d221e2258cc6dc7b1e6068/actionview/lib/action_view/template.rb)

このクラスの中心となるのはなんといっても `render` です。
`render` は `@source` をコンパイルして引数に`view` にメソッドを追加します。
作成したメソッドを呼び出すことで出力を作成してそれを返します。
`render` は終わると `!render_template.actiov_view` という通知を発生させます。

```ruby
require 'active_support/all'
require 'action_view'

template = ActionView::Template.new("hoge <%= hoge %>","hogehoge", ActionView::Template::Handlers::ERB, virtual_path: 'app', locals: ["hoge"])
view = Object.new
template.render(view, hoge: "mogu") # => hoge mogu
# メソッドができている
view.public_methods.grep /hogehoge/ # => [:_hogehoge__4232839685693881901_70360678597660]
```

ActionView::Template
--------------------------------------------------------------------------------
### Finalizer

オブジェクトの後片付けをするファイナライザー。よくわからん。

### supports_streaming?

ストリーミングをサポートしているかどうかを返す

### render

* render(view, locals, buffer=nil, &block)

引数view には テンプレートファイルを実行するコンテキストオブジェクト、引数 locals は追加のローカル変数を、引数 buffer にはrender 結果を格納するオブジェクトが渡せます。

### mime_type

rails 4.1 で消える予定のメソッドです。
代わりに `type` メソッドを使います。"

### type

ファイルタイプを返します。

### refresh

* refresh(view)

引数 view をコンパイル済みであれば再読込するよです。

### encode!

ソースファイルをエンコードしなおします。Binaryの場合は特になにもしません。よくわからない。
