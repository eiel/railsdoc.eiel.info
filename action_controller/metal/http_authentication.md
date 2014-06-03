---
title: ActionController::HttpAuthentication
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.2.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/http_authentication.rb)

BASIC認証とかDigest認証とかToken認証を提供する。

ActionController::HttpAuthentication::Basic::ControllerMethods::ClassMethods
--------------------------------------------------------------------------------
コントローラのクラスメソッドが呼び出せる場所で使える。


### #http_basic_authenticate_with

* http_basic_authenticate_with(options = {})


options には name password realm が指定できる。
一番楽にBasic認証を設定する方法

ActionController::HttpAuthentication::Basic::ControllerMethods
--------------------------------------------------------------------------------

コントローラのインスタンスメソッドとして使えるメソッドを提供する

### authenticate_or_request_with_http_basic

* authenticate_or_request_with_http_basic(realm = "Application", &login_procedure)

第1引数がレルムで具体的なログイン処理はブロックで自由に実装できる。
ブロッグの第1引数にはユーザ名、第2引数にはパスワードがはいる。

認証できなかった場合は、401のリクエストを生成してブラウザへ返す。
この部分は HttpAuthentication::Basic.authentication_request が担う。

### authenticate_with_http_basic

HttpAuthentication::Basic.authenticateに処理を委譲する。
実際の認証確認を行う部分。


### request_http_basic_authentication

ブラウザに認証してくださいという情報を生成する部分。
HttpAuthentication::Basic.authentication_request に委譲されてる。


