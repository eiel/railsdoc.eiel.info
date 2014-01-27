---
title: ActionDispatch::Journey::Router::Utils
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/router/utils.rb)

いろんなところで使う関数が定義されてる

ActionDispatch::Journey::Router::Utils
--------------------------------------------------------------------------------

### .normalize_path

* normalize_path(path)

path の先頭がスラッシュでなければ追加したり、最後のスラッシュを削除したりパーセントエンコードされてる部分のアルファベットを大文字にしたりする。

### .escape_path

パスに含まれる / をエスコープする。

### .escape_fragment

フラグメントに含まれる / や ? をエスケープする

### .unescape

エスケープしたものを取り除く。

ActionDispatch::Journey::Router::Utils::UriEscape
--------------------------------------------------------------------------------

url を escape するための値が保存されてる。
