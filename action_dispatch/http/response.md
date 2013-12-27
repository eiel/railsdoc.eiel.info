---
title: ActionDispatch::HTTP::Response
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/response.rb)

普通につかってる分には出くわすことはないけど、テストコードなんかでは見る機会があるかもしれない。

ヘッダーにアクセスしたい場合は `[]` が使える。

monitor というのが require されてるけど知らないから調べたい。

to_a メソッド rack へ対応した形式へ変換できる。
