---
title: ActiveRecord::Associations::Builder::Association
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

つながりを表現するクラスの基底クラスである`ActiveRecord::Associations::Builder::Association`が定義されている。
役割としては`ActiveRecord::Reflection`を生成する。なのでBuilderの模様。

派生クラスは

* SingularAssociation
  * BelongsToAssociation
  *  HasOneAssociation
* CollectionAssociation
  * HasManyAssociation

がある。

### .build

* build(model, name, scope, options, &block)

リフレクションを構築する。
builderをつくり、このbuilderをつかってリフレクションをつくる。
そして、つくったリフレクションをmodelと紐付けていく。

builderはこのクラスのインスタンス。

### .create_builder

* create_builder(model, name, scope, options, &block)

.buildメソッドでbuilderをつくっているメソッド.
nameがシンボルであることを確認してコンストラクタに渡す。

### #build

modelをうけとActiveRecord::Reflectionを作る。

### #macro

実装されていない。サブクラスで実装するのかな。

### #valid_options

valid_optionの一覧を返す。デフォルトでは以下を返す

* :class_name
* :class
* :foreign_key
* :validate

extensionがあれば増える。

### #validate_options

valid_optionsをつかってオプションのチェックをする。

### #define_extensins

特に実装されていない。サブクラスなどで使われると思われる。

### .define_callbacks

modelにコールバックを追加する。

### .define_accessors

モデルにアクセッサを追加する。

### .define_readers

モデルへ関連のよみこみメソッドを実装する。

```
association(:#{name}).reader(*args)
```

という実装になっている。


### .define_writers

モデルへ関連の書き込みxメソッドを実装する。

```
 association(:#{name}).writer(value)
````

という実装になっている。


### .define_validations

実装されてなくて例外が発生する。サブクラスでオーバーライドするの思われる。
