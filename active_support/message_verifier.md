---
title: ActiveSupport::MessageVerifier
---


試した環境

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/message_verifier.rb)


MessageVerifier は署名署名されたメッセージを手軽に検証するためのクラスです。
署名した情報をクッキーに挿入しておいて信頼性を向上したりできるっぽい。

秘密鍵を用意して `#generate` メソッドで署名し、`#verify` メソッドで検証ができます。

ActiveSupport::MessageVerifier
--------------------------------------------------------------------------------

OpenSSL::HMAC.hexdigest をつかって署名している模様。
検証に失敗したら InvalidSignature 例外が発生します。

### initialize

* initialize(secret, options = {})

引数 `secret` には秘密鍵を設定できます。
引数 `options` には `:digest` と `serializer` が指定できます。

### verify

* verify(signed_message)

引数 `signed_message` に署名済みの情報を渡します。
nil や 空文字を渡すと InvalidSignature 例外が発生します。

### generate

* generate(value)

引数`value` に署名します。署名とデータは "--" で接続されます。
