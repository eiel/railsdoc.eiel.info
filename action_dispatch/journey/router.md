---
title: ActionDispatch::Journey::Router
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.2/actionpack/lib/action_dispatch/journey/router.rb)

Joureny のルーティングを行う場合のエントリーポイントともいえそう。
Rackオブジェクトになっている。

ActionDispatch::Journey::Routes を受け取り生成される。
path_info の情報をもとに routes をフィルタリングする。
GET で応答できるものは HEAD でも応答ができるように route が追加される。

call はアプリケーションとして動作してしまうので、 recognize メソッドを使えば有効なルートをうけとれる。

`visualizer`メソッドでは GTG.Builder をつかって`Routes FSM with NFA simulation`というHTMLする。
どうやら dot言語を生成し svg を生成して html にする模様。

```
$ bundle exec rails runner "puts Rails.application.routes.router.visualizer" > viz.html
```

ActionDispatch::Journey::Router::RoutingError
--------------------------------------------------------------------------------

ここでは定義のみ。

ActionDispatch::Journey::Router::NullReq
--------------------------------------------------------------------------------

option に request_class が指定されていない場合に利用されるリクエストクラス
* REQUEST_METHOD
* PATH_INFO
* REMOTE_ADDR

が必要になることを示しているとも言える。
call でうけとった env をつかって構築する。
