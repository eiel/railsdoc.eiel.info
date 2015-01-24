---
title: ActiveModel::SecurePassword
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/secure_password.rb)

パスワード機能を実装しやすくためのモジュール。
`has_secure_password`クラスメソッドを実行すると有効になり、password_confirmationとpasswordが一致しないとバリデーションに失敗するようになる。
パスワードはBCryptでハッシュ化されてpassword_hashに保存される。

authenticateメソッドでパスワードが正しいか確認することができる。
