---
title: ActionView::PartialRenderer
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_view/renderer/partial_renderer.rb)

部分テンプレートを render する際の処理が実装されています。
部分テンプレートかどうかの判断は [ActiovView::Renderer](action_view/renderer/render) によってされて、処理が流れてきます。

コレクションやオブジェクトを渡してローカル変数に割り当てる機能があるのでやや複雑になっています。

:layout オプションに対する処理があるのが気になる。

collection を render する場合は "render_collection.action_view" という通知が発生します。
追加情報として :identifier と :count が引数で渡されます。

collection でない場合は partai になります。 "render_partial.action_view" という通知が発生します。render に文字列を渡した場合は、:object 引数を渡せます。
render にオブジェクトを渡した場合は、これが :boject として扱われます。
