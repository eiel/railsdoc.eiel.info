---
title: ActiveSupport::OrderedHash
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'mi
4.0.0
```


* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/ordered_hash.rb)

Ruby 1.8のころは Hash の key の並びにルールはありませでしたが、これを辞書順にするための OrderedHash がありました。
1.9 以降は Hash 自身がそのようになったため機能的には不要になりました。

現在は YAML 形式で出力する際に omap であることを追加する処理が少しだけ追加されています。
