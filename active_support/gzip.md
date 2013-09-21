---
title: ActiveSupport::Gzip
---

試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/gzip.rb)

Gzip 圧縮、解凍するメソッドが定義されている。
圧縮には ActiveSupport::Gzip.compress。解凍には ActiveSupport::Gzip.decopress を使用する。ともに文字列を返す。

ActiveSupport::Gzip
--------------------------------------------------------------------------------

### .decompress

* decompress(soruce)

Gzip 圧縮された soruce 文字列を解凍する。

### .compres

* compress(source, level=Zlib::DEFAULT_COMPRESSION, strategy=Zlib::DEFAULT_STRATEGY)

source 文字列を圧縮する。引数で圧縮率やストラテジーを変更可能
