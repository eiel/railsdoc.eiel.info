---
title: ActiveModel::AttributeMethods
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

attribute_methodに関する操作のメソッドが定義されています。

attribute_methodはもっている属性に関するメソッドをまとめて実装できる機能です。
prefix や suffix をつけてもっている属性すべてに同じメソッドが実装できます。

`@generated_attribute_methods`に格納されたモジュールにメattirbute|methodが定義されている。
attribute_method_mathecrsに追加されているmatherが組み合わせて最終的なメソッド名が決まる。

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/attribute_methods.rb)

# ActiveModel::ClassMethods

### .attribute_method_prefix

引数に渡されたprefixをAttributeMethodMatcherに包んで`attribute_method_matchers`に追加する。

いままで生成されていたattribute_methodは削除される。

### .attribute_method_suffix

引数に渡されたsuffixをAttributeMethodMatcherに包んで`attribute_method_matchers`に追加する。

いままで生成されていたattribute_methodは削除される。

### .attribute_method_affix

prefixとsuffixの両方が設定できる。

### .alias_attribute

エイリアスをつくる。
atributes_methodにもエイリアスがかかります。

### .attribute_alias?

引数の名前がエイリアスかどうか確認します。

### .attribute_alias

なににエイリアスされてるか返します。

### .define_attribute_methods

attirubet_methodを定義します。
実装は別途メソッドを定義する必要があります。

### .define_attribute_method

define_attribute_methodsはリスト対応しているだけ。

### .undefine_attribute_methods

定義されているattribute_methodを削除する。

### .generated_attribute_methods

メソッドを定義するモジュールを生成してincludeする。
