---
title: ActiveModel::Serializers::XML
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc3
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc3/activemodel/lib/active_model/serializers/xml.rb)

`from_xml` と `to_xml` を提供する。

XMLからモデルオブジェクトをつくったり、モデルオブジェクトをXMLにしたりする。

to_xmlするときのoptionには `:builder` で構築するビルダーを変更したり、`:indent`でインデントの量を調節したり,`:namespace`で名前空間の指定もできる。
