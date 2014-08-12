---
title: Thor::Actions::Directory
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/v0.19.1/lib/thor/actions/directory.rb)

Thor::Actions
---

### #directory

* directory(source, *args, &block)

引数source に指定したディレクトリの中にあるものをまるまるコピーする。
第二引数に destination を指定することもできるけど、指定しない場合は source 名が使用される。

block はファイルをコピーまたはtemplate を展開する際に利用される。

Thor::Actions::Direcotry
---

Thor::Actions#directory の実装。

[Thor::Actions::EmptyDirectory](/thor/actions/empty_directory)を継承している。

.empty_directory があるディレクトリの場合の処理がある。
