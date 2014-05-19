---
title: ActionView::Rendring
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/rendering.rb)


ActionView::I18nProxy
--------------------------------------------------------------------------------

コンストラクタの第1引数をプロキシできるのだけど、locale は常にオリジナルの値を返す。locale に代入すると lookup_context のほうの値を変更する。


ActionView::Rendering
--------------------------------------------------------------------------------

ActionController と結びつけをしている部分と思われる。
i18n への対応もここで行われている。

ActionView::Base を context にして、lookup_context を使い表示するViewを探す。

この context と lookup_context を使い、ActionView::Rendererがビューをレンダリングする。

context への変数の割り当てや、helperのわりあてもここで行われる。
[AbstractControllerr::Rendering](/abstract_controller/rendering)が提供する view_assigns によってインスタンス変数が context に渡される。
controller も参照をそのままうけわたされるため、view からは controller にもアクセス可能。
