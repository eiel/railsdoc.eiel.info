---
title: ActionDispatch::Cookies
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/cookies.rb)

ActionDispatch::Request に #cookie_jar メソッドを追加する。
このメソッドは `env['action_dispatch.cookies']` に CookieJar のインスタンスを格納する。


ActionDispatch::Cokkies::ChainedCookieJars
--------------------------------------------------------------------------------

### permament

20年間保持するクッキーを生成できる模様。

### signed

署名された情報をクッキーに保存できる模様

### encrypted

暗号化された情報をクッキーに保存できる模様。

### signed_or_encrypted

秘密鍵があれば暗号化に、そうでなければ署名になる。
