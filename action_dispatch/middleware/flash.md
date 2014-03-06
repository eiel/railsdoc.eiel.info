---
title: ActionDispatch::Callback
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/flash.rb)


Request オブジェクトに flashを追加する。
env の `action_dispatch.request.flash_hash` に保存する。このキーは`Flash::KEY` で設定されてる。

また、ここに保存されてる Flash::FlashHash のインスタンスで `session["flash"]` から生成する。


ActionDispatch::Flash
--------------------------------------------------------------------------------
rack middleware として使え flash を提供する。

ActionDispatch::Flash::FlashNow
--------------------------------------------------------------------------------
コンストラクタに渡されるのは FlashHash のインスタンス。
FlashHashのインスタンスからは `now` メソッドでアクセスする。


ActionDispatch::Flash::FlashHash
--------------------------------------------------------------------------------
@discard に保存されてる値をセッションを復元する度に整理する機能をもっている。FlashNowを経由すると一度アクセスすると消える値を設定できる。
