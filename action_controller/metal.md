---
title: ActionController::Metal
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/actionpack/lib/action_controller/metal.rb)

AbstractController::Base と ActionController::Base の間を繋ぐのが ActionController::Metal。
ActionController は全部入りだけど、最低限機能をもってるのがMetalなんじゃないかと思っている。

metal ディレクトリにはいっているものは ActionController Metal であれば使えるモジュールという位置づけっぽい。

ActionController::MiddlewareStack
--------------------------------------------------------------------------------

コントローラ上に積まれた Midoleware を保存しているスタック用のクラス。

ActionController::MiddlewareStack::Middleware
--------------------------------------------------------------------------------

コントローラのクラスコンテキストで使えるミドルウェア。
only や except オプションがあり、around_actionと同じように使える。

ActionController::Metal
--------------------------------------------------------------------------------

可能な限りシンプルな Rack に対応したコントローラ。
`self.response_body` への代入は自分で行う必要がある。

metal ディレクトリで定義されてるモジュールを include すると機能追加できる。

params は request.parameters からひきつぐ。
