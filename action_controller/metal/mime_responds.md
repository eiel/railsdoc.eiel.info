---
title: ActionController::Metal::MimeResponds
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.2.rc1
```

コントローラに respond_to を提供する。
アクションが返せる形式を登録する機能。

ActionController::MimeResponds
--------------------------------------------------------------------------------

### .respond_to

クラス変数 mimes_for_respond_to に登録した情報が記録される。
only や except は各拡張子ごとに保存される仕組みらしい。

### .clear_respond_to

クラス変数 mime_for_respond_to の情報をリセットする。

### #respond_to

* respond_to(*mimes, &block)

mimse と block どちらかしか指定できない。

block は ActionController::MimeResponds::Collector のインスタンスを第1引数からうけとる。
リクエストに応じて必要な処理を選択する。

### #respond_with

リソース用のrespond_to で定番の処理を自動生成する。

ActionController::MimeResoponds::Collector
--------------------------------------------------------------------------------

respond_to のための DSL を提供する。

response でリクエストオブジェクトをうけとり必要な処理が選択される。

ActionController::MimeResponds::VariantCollector
--------------------------------------------------------------------------------

Rails 4.1 で追加された variant の部分のDSLを提供する。
