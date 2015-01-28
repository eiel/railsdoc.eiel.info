---
title: ActiveModel::Validations
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validations.rb)

validationのためのモジュール。
ActiveModel::Validationsをincludeして使う。

## ActiveModel::Validations

### .validates_each

複数の属性に対してblockでまとめてバリデータを設定できる。
内部でvalidets_with に BlockValidator を渡している。

### .validate

ブロックをつかってクラス内でバリデータを作成する。

### .validators

登録されているバリデータの一覧を返す。

### .clear_validators!

登録されているバリデータを削除する。
reset_callacksがよばれる。

### .validators_on


指定した属性のバリデータを返す。

### .attribute_method?

指定した属性が存在するか確認する。

### #errors

ActiveModel::Errorsのインスタンスへのアクセッサ

### valid?

バリデータを使って検証できる。
引数に値を渡すとvalidation_contetxtの差し替えができる。

errorオブジェクトがあるかどうかで判断する。

### invalid?

not valid?
