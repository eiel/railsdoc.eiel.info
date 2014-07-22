---
title: Thor::CoreExt::HashWithIndifferentAccess
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/core_ext/hash_with_indifferent_access.rb)

Hash を拡張したクラス。key を強制的にシンボルに変換したHashで文字列でもアクセスできる。key が存在するかどうかを key 名にクエスションマークをつけるだけで確認できる。
