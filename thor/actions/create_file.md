---
title: Thor::Actions::CreateFile
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/actions/create_file.rb)

Thor::Actions
---

### create_file

* create_file(destination, *args, &block)

引数 destination にファイルを作成する。

 Thor::Actions::CreateDirectory を起動するだけ。

ブロックを渡せばブロックが最後に評価しな内容のファイルをつくり、文字列を渡すと文字列を使う。

Thor::Actions::CreateFile
---

[Thor::Actions::EmptyDirectory](/thor/actions/empty_directory)を継承してつくられている。

revoke! メソッドは rm_rf で削除するだけなのでそのまま使われている。

### identical?

生成されるファイルとすでにあるファイルが一致するか確認する。
