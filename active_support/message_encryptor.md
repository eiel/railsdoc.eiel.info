---
title: ActiveSupport::MessageEncryptor
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

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/message_encryptor.rb)

盗聴される恐れのあるようなデータを保存するのにシンプルな方法を提供するクラスです。

base64 でエンコードされた暗号データを返します。
`ActiveSupport::MessageVerifier` と使う場面は似ているけどペイロードの値を決めて欲しくない時に使用するらしい英語がよくわからない。こっちのほうがいろいろやるみたい。

種をつくりそこからパスワードで秘密鍵をつくり、この鍵をつかって暗化する。

```ruby
salt  = SecureRandom.random_bytes(64)
key   = ActiveSupport::KeyGenerator.new('password').generate_key(salt) # => "\x89\xE0\x156\xAC..."
crypt = ActiveSupport::MessageEncryptor.new(key)                       # => #<ActiveSupport::MessageEncryptor ...>
encrypted_data = crypt.encrypt_and_sign('my secret data')              # => "NlFBTTMwOUV5UlA1QlNEN2xkY2d6eThYWWh..."
crypt.decrypt_and_verify(encrypted_data)                               # => "my secret data"
```

ActiveSupport::MessageEncryptor::NullSerializer
--------------------------------------------------------------------------------

なにもしないシリアライザーのインターフェイスをもってるだけ。

* .load(value)
* .dump(value)

ActiveSupport:MessageEncryptor
--------------------------------------------------------------------------------

暗号化を行うクラス。署名も行う。

### #initialize

* initialize(secret, *signature_key_or_options)

引数 secret は必須で 引数 signature_key_or_options には単体では signaturee_key となり、 hash を渡すとオプションになります。
オプションには :cipher と :serializer を渡せます。
:cipher には OpenSSL::Cipher.ciphers が返す値が使えます。
デフォルトでは aes-256-cbc となります。
:serializer はデフォルトで Marshal になります。

### #encrypt_and_sign

* encrypt_and_sign(value)

引数 value を暗号化して署名をします。

### #decrypt_and_verify

* decrypt_and_verify(value)

引数 value を復号して検証します。
