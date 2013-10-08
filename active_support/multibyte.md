---
title: ActiveSupport::Multibyte
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

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/multibyte.rb)

ActiveSupport::Multibyte::proxy_class でプロキシーされるクラスを取得して使うのかな？どこか必要になるところで実体は意識せずに使えるようにするのが目的な気がする。
デフォルトでは ActiveSupport::Multibyte::Chars に設定されています。
他にも `CharsForUTF32` などが指定できます。

ActiveSupport::Multibyte::Chars
--------------------------------------------------------------------------------
String をラップしてマルチバイトに対応したメソッドを提供する。

ActiveSupport::Multibyte::Unicode
--------------------------------------------------------------------------------
Unicode のためのいろんなもがはいってるっぽいけどちゃんと見てない。
