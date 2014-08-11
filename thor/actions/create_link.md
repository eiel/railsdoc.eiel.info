---
title: Thor::Actions::CrateLink
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/v0.19.1/lib/thor/actions/create_link.rb)

Thor::Actions
---

### create_link

* create_link(destination, *args, &block)

引数 `destination` を `args.first` をソースにシンボリックリンクを作成

ファイルがすでに存在する場合は削除を行う。
オプションに `symbolic: false` を指定するとハードリンクが作成できる。

Thor::Actions::CreateLink
---

[Thor::Actions::CreateFile](/thor/actions/create_file) を継承している。

invoke! exists? identical? を上書きしている。
