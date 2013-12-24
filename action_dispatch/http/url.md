---
title: ActionDispatch::HTTP::URL
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/url.rb)

`url_for` を提供する。path であれば host名やport番号が決まっていなくても決定できるが、 url を作成するには Controller レイヤーでアクセスされた時の値を使わずに決定しなければならない。
これに必要な情報を生成する部分が実装されている。
`tld_length` という mattr が用意されていて tld の長さを指定できる。
