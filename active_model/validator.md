---
title: ActiveModel::Validator
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validator.rb)

Validatorを作るときの基底(抽象)クラスである`ActiveModel::Validator`とこれを派生した実際に継承する`ActiveModel::EachValidator`と`ActiveModel::BlockValidator`が定義されています。

ActiveModel::Validator
--

### .kind

バリデータの種類を返す。クラス名をベース作成する。
名前空間を外してValidatorを削除したものをシンポルで返す。

EachValidatorなら:each を返す。

匿名クラスならnilを返す。


### #kind

`.kind`の値を返す。

### #validate

* validate(record)

サブクラスで実装する必要のあるメソッド。
引数にレコードがわたるので


ActiveModel::EachValidator
--

コンストラクタでチェックする属性をうけとり、その属性をすべてチェックしてくれるバリデータの抽象クラス。validate_eachメソッドをオーバライドする。

ActiveModel::EachValidator.new(attributes: [:hoge, :goro])のように使う。

allow_nil と allow_blank オプションがあり、nilと空っぽかどうかのチェックができる。

### #validate

コンストラクタでうけとった属性をつかってvalidate_eachメソッドを呼ぶ。

### #validate_each

* validate_each(record, attribute, value)

属性ひとつひとつにするチェックをオーバライドする。
valueは read_attribute_for_validation メソッドをつかってレコードから取り出したものがはいる。


ActiveModel::BlockValidator
--

EachValidatorをオーバライドしてブロックで validate_each の中身を実装するクラス。
コンストラクタでブロックを渡す。
