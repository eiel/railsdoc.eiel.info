---
title: ActionController::ModelNaming
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/actionpack/lib/action_controller/model_naming.rb)

オブジェクトをモデルに変換するメソッドと、レコードもしくはクラス名からモデルを作成するメソッドが定義されてる。

ActionController::ModelNaming
--------------------------------------------------------------------------------

[ActionView::ModelNaming](/action_view/model_naming) と重複してる気がする。
ルーティングによる url 変換あたりで使われているっぽい。

### #convert_to_model

* convert_to_model(object)

obeject を モデル名に変換。 基本 to_model をよぶかそのまま

### #model_name_from_record_or_class

* model_name_from_record_or_class(record_or_class)

レコードかクラスを渡すとモデル名へ変換できる
