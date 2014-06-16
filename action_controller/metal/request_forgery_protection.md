---
title: ActionController::ParamsWrapper
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/request_forgery_protection.rb)

CSRF を防ぐための機能が実装されている。

`.protect_from_forgery` メソッドをコントローラで呼び出すと有効になる。
JSONのみの場合はうけつけても良いとしたい場合は多少設定が必要。

ActionController::RequestForgeryProtection
--------------------------------------------------------------------------------


### .protect_from_forgery

* protect_from_forgery(options = {})

only exception オプションが使え、特定のアクションのみ有効にしたり無効したりすることも可能。

with オプションでストラテジーを変更可能で、デフォルトでは :null_session になる。
他には :reset_session と :exception がある。
種類によってインスタンスを生成するクラスが変化する。

null_session の場合は、セッションはそのままで一時的に空っぽのセッションを使うことにのり、reset_session はログイン情報がリセットされ、 :exception の場合は例外が発生するように実装されている。

アクションの実行前に verify_authenticity_token メソッドの実行。
アクションの実行後に verify_same_origin_request メソッドの実行する。

### verifi_authenticatiy_token

基本的にはリクエストについてきた値に トークンが含まれていて正しいか確認する。
xhr によるアクセスの場合は警告が付与される。

