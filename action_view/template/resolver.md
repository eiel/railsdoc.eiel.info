---
title: ActionView::Template::Resolver
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/e20dd73df42d63b206d221e2258cc6dc7b1e6068/actionview/lib/action_view/template/resolver.rb)

ActionView::Resolver::Path
--------------------------------------------------------------------------------


テンプレートファイルのファイルパスを示すクラス。
build メソッドを使うと部分テンプレートの場合 `name` に接頭辞として `_` を補完し、virtual を構築する
`
* name ファイル名
* prefix 接頭辞
* partial 部分テンプレート
* virtual 仮想パス

といった意味合いだと思われる。

to_s は virtual を返す。

