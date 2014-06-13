---
title: ActionController::Redirecting
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/redirecting.rb)

コントローラの中でリダイレクトをするためのメソッド redirect_to を提供する

ActionController::Redirecting
--------------------------------------------------------------------------------

### #redirect_to

* redirect_to(options = {}, response_status = {})

さまざまな引数に態様してる。
実際にその処理を行うのは `#|comute_redirect_to_location`

第一引数には url や Hash 、`:back`、Proc などが渡せる。
ステータスコードはデフォルトだと302になる。 status を指定することもできる。

### #_compute_redirect_to_location

redirect_to の location を決定するために redirect_to からの option を処理する

* もともと URL なら そのまま使う。
* それ以外の文字列なら プロトコルとホスト名を追加
* :back の場合は Referer から生成
* Proc の場合は評価結果を再度 _comute_redirect_to_location へ
* それ以外は url_for へ渡す
