---
title: ActiveSupport::XmlMini
---

試した環境


```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

ActiveSupport::XmlMini を読み込む方法

```ruby
require 'active_support/xml_mini'
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/xml_mini.rb)

デフォルトでバックエンドには REXML が使われます。
libxmlを利用したい場合は

```ruby
XmlMini.backend = 'LibXML'
```

とすることで切り替えができます。

ActiveSupport::XmlMini::FileLike
--------------------------------------------------------------------------------

ファイルのように扱う際の情報を保存、取り出しをできるようにする。
元のファイル名とコンテントタイプを保存、読み出しができる。

### #original_filename

未設定の場合は `'untitled'` を返します。

### #content_type

未設定の場合は `'application/octet-stream'` を返します。

ActiveSupport::XmlMini
--------------------------------------------------------------------------------

### DEFAULT_ENCODING

type によってはエンコーディングが必要になります。
必要な場合のタイプと変更後の形式をHashで保存しています。

### TYPE_NAMES

Ruby のオブジェクトをシリアライズする際にクラス名の変換ルールが保存されています。

### PARSING

`TYPE_NAMES` デシリアライズする際にRubyオブジェクトに戻す際の処理が `TYPE_NAME` の値をキーに登録されています。

### #backend

XMLのバックエンドを返します。
インスタンス変数に保存されますが、スレッドローカルな変数に保存しておくとこちらが優先されます。
スレッドローカルな変数に保存するには `current_thread_backend=` を使いますが、このメソッドはprivateです。
`with_backend` メソッドで利用されています。

### #with_backend

* with_backend(name)

一時的に XML のバックエンドを切り替えられるメソッドです。
ブロック内だけ変更が有効化されます。

### #to_tag

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

3つめの それ以外の場合は options[:builder] を利用して構築します。
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
### #rename_key

* rename_key(key, options = {})

引数`key` を options に従い変更します。
指定できるのは `:dasherize` と `camelize` です。
camelaize して dasherizeされます。

```ruby
require 'active_support/xml_mini'

ActiveSupport::XmlMini.rename_key('hoge_goro',dasherize: true) # => "hoge-goro"
ActiveSupport::XmlMini.rename_key('hoge_goro',camelize: true) # => "HogeGoro"
ActiveSupport::XmlMini.rename_key('hoge_goro',camelize: true, dasherize: true) # => "HogeGoro"
ActiveSupport::XmlMini.rename_key('hoge-goro',camelize: true, dasherize: true) # => "Hoge-goro"
```

### #parse

パースします。
処理は backend に丸投げ。
backend はデフォルトで REXML になっています。

このメソッドを利用しているファイル

* [active_support/core_ext/hash/conversions](/active_support/core_ext/hash#Conversions)
