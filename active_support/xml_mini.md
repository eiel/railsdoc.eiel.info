---
title: ActiveSupport::XmlMini
---

試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc1
```

ActiveSupport::XmlMini を読み込む方法

```ruby
require 'active_support/xml_mini'
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/xml_mini.rb)

### .to_tag

* to_tag(key, value, options)

key, value から タグを生成するメソッド。

おおきく分けて3パターンの分岐。

* value が Method か Proc オブジェクトの場合
* value に to_xml が実装されている
* それ以外の場合

value が Method か Proc オブジェクトの場合はオブジェクトがcall時に呼び出す手続の引数によって変化。
ひとつの場合は 引数 options に root と skip_instruct を加えたものでコールバック。
ふたつの場合は 第二引数に 引数key の単数形にしたものを加えてコールバック。

2つめの value に to_xml が実装されている場合は、to_xml を実行。
引数には、引数optionsの値に root と skip_instruct を加えたものを渡してコールバックします。

3つめの それ以外の場合は options[:buildr] を利用して構築します。
options ですが実質必要引数になります。

このメソッドを利用しているファイル

* [active_support/core_ext/hash/conversions](/active_support/core_ext/hash#Conversions)

### .rename_key

* rename_key(key, options = {})

key の名前を修正するためのメソッド。 camerize と dasherize ができる。

このメソッドを利用しているファイル

* [active_support/core_ext/hash/conversions](/active_support/core_ext/hash#Conversions)

例

```ruby
ActiveSupport::XmlMini.rename_key("hoge mogu")
# => "hoge-mogu"
ActiveSupport::XmlMini.rename_key("hoge mogu", camelize: true)
# => Hage-mogu
ActiveSupport::XmlMini.rename_key("hoge mogu", camelize: true, dasherize: true)
# => Hoge mogu
```


### .parse

パースします。
処理は backend に丸投げ。
backend はデフォルトで REXML になっています。

このメソッドを利用しているファイル

* [active_support/core_ext/hash/conversions](/active_support/core_ext/hash#Conversions)
