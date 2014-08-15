---
title: Thor::Actions::InjectIntoFile
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/v0.19.1/lib/thor/actions/inject_into_file.rb)

ファイルに内容を差し込みする inject_into_file が定義されています。

Thor::Actions
---

### #insert_into_file

* insert_into_file(destination, *args, &block)

inject_into_file の別名がある。ファイル名からするとこっちがメインでは？

引数 destination に対象ファイル、第二引数またはblockが返す文字列を挿入する。
どこに挿入するかは `:after` または `:before` で指定する。


Thor::Actions::InjectIntoFile
---

Thor::Actions#insert_into_file の実装。

一番先頭に追加すると pretend 表示になり、一番最後たど append 、そうでない場合は insert になるようにステータス表示がつくられていた。
