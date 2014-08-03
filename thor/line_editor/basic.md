---
title: Thor::LineEditor::Basic
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/line_editor/basic.rb)

ラインエディタの基本的なところが実装されている。

コンストラクタは第一引数がプロンプトで、第2引数が、options で echo を false にすると echo しないようにできる。
