---
title: ActionDispatch::Middleware::Session::CokkieStore
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/session/cache_store.rb)

[AbstractStore](abstract_store) を継承したStore の一つ。
デフォルトのストア。

Cookkie 容量制限を越えた場合 CookieOverflow 例外が発生する。

secret_token を設定すれば cookie は署名されるらしい。

secret_key_base を設定すれば暗号化されるらしい。

rake spec をすると秘密鍵が生成される。

とはいえ、そこに関する処理はここには書かれてなさそう。
暗号化や署名の処理はある。
