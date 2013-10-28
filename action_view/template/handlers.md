---
title: ActionView::Template::Handlers
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/e20dd73df42d63b206d221e2258cc6dc7b1e6068/actionview/lib/action_view/template/handlers.rb)

extend して使う。`ActienVIew::Template` に exclude されています。

テンプレートの名前で使う拡張子と処理するためのオブジェクトの関係を登録できる。
デフォルトも登録することができて `register_default_template_handler` を利用する。
普通に登録するには `register_template_handler` を利用する。
また、登録されている拡張子は `template_handler_extensions` を使うリストが返ります。

rails の console で

```ruby
ActionView::Template.template_handler_extensions
```

とすると取得できます。

実際に拡張子から処理するためオブジェクトを取得するには `handler_for_extension`を使います。一致しない場合に nil が欲しい場合は `registered_template_handler`
この処理するオブジェクトは `call` メソッドが必要で第一引数にテンプレートを渡します。

デフォルトで erb が利用され、 builder, raw, ruby にも最初から対応しています。

Railsに添付されている Handller

* [ActionView::Template::Handlers::ERB](/action_view/template/handlers/erb)

ActienView::Template::Handlers
--------------------------------------------------------------------------------
### .extensions

対応している拡張子をシンボルのリストで返します。

### register_template_handler

* register_template_handler(*extensions, handler)

対応する拡張子とその拡張子に対応する際の処理を登録します。
`handler` には callメソッドがあることが期待されます。

### template_handler_extensions

処理できる拡張子の一覧を並び変えて文字列で返します。

### registered_template_handler

* registered_template_handler(extension)

引数 extension のための処理をするオブジェクトを返します。対応するものがない場合 nil を返します。

### register_default_template_handler

* register_default_template_handler(extension, klass)

`register_template_handler` もするけど、対応する拡張子がない場合の処理するものとして設定します。

### handler_for_extension

* handler_for_extension(extension)

引数`extension` の処理をするオブジェクトを返します。
対応するものがなければ `register_default_template_handler` で登録したものを返します。
