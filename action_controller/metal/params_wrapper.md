---
title: ActionController::ParamsWrapper
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionpack/lib/action_controller/metal/params_wrapper.rb)

クライアントから

`{"name": "Konata"}` のようなパラメータが送信されてきた場合に、
`{"name" => "Konata", "user" => {"name" => "Konata"}` のような形に修正してくれる機能を提供する。
`params['user']` でアクセスできるためコントローラでの処理が都合がよい。

ラップするキーを指定するには

```ruby
class PersonController < ApplicationController
   wrap_parameters User
end
```

のようになる。


ActionController::ParamsWrapper::Options
--------------------------------------------------------------------------------

PramsWrapper の設定値を保持するクラス。

`authenticity_token` `_method` `utf8` はデフォルトで無視するキーとして指定されてる。

name はコントローラの名前から自動決定できるような処理が用意されている。

ActionController::ParamsWrapper
--------------------------------------------------------------------------------


継承したコントローラの設定値は引き継ぎされるようになってる。

### .wrap_parameters

コントローラで設定を行うためのメソッド。

false を指定すると無効状態にできる。

`format`,`include`,`exclude` オプションが指定できる。
`include` と `exclude` の両方を指定すると `include` が優先される。

### #process_action

アクションを実行する前に処理を追加する。
具体的な処理はここにある。
