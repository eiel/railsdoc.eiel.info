---
title: ActionView::ModelNaming
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/model_naming.rb)

ActionView::ModelNaming
--------------------------------------------------------------------------------

### convert_to_model

*  convert_to_model(object)

object を model へ変換する。to_model メソッドがあればそれを使い、なければ、そのまま。FormBuilder 系で使われてる。

### model_name_from_record_or_class

* model_name_from_record_or_class(record_or_class)

レコードオブジェクトまたはクラスオブジェクトからモデルのクラスを決定します。リンク生成なんかで使われていた気がする。
