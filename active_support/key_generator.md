---
title: ActiveSupport::KeyGenerator
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

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/key_generator.rb)

[PBKDF2](http://d.hatena.ne.jp/tmatsuu/20120106/1325852543) を使うための OpenSSL へのラッパーの ActiveSupport::KeyGenerator とこのジェネレータを ActiveSupport::ThreadSafe::Cache を使うためのクラスが定義されている。

`ActiveSupport::LegacyKeyGenerator`というものも定義されていて シークレットが30文字より小さいことと空でないことを確認してsaltを利用しないジェネレータも定義されている。
どこで使われてるかまでは調べてない。


ActiveSupport::KeyGenerator
--------------------------------------------------------------------------------

### initialize

* initialize(secret, options = {})

引数`secret` に秘密鍵にし、引数`options` には :iterations が使える。デフォルトでは 2**16 が利用されます。

### generate_key

* generate_key(salt, key_size=64)

引数`salt` をsalt に 引数`key_size` の鍵を生成します。
コンストラクタで渡されている secret と iterations を利用して OpenSSL::PKCS5.pbkdf2_hmac_sha1 を呼び出します。


ActiveSupport::CachingKeyGenerator
--------------------------------------------------------------------------------

ThreadSafe::Cach を利用するためのクラスで generate_key メソッドをもっているので違いを意識せずに利用できる。

ActiveSupport::CachingKeyGenerator
--------------------------------------------------------------------------------

Legacy とついてるので深追いしなくていいかと思いている。saltが利用されてない点など気になる箇所がいくつか。
