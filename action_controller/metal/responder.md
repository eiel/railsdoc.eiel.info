---
title: ActionController::Responder
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2.rc2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc2/actionpack/lib/action_controller/metal/mime_responds.rb)

`respond_with` の処理を実装しているクラス。
デフォルトの responder となってるだけで`ActionController::Base.responder` に代入すると差し替えることも可能。

アクション名によって動作を変えたり、要求されている mime type によって動きが変わるようにできている。

respond_with に渡したオプションは render 時に利用される。

失敗した時の処理はブロックに記述できる。
