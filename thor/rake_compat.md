---
title: Thor::rake_compat.md
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/v0.19.1/lib/thor/rake_compat.rb)

rake のタスクを Thorのコマンドとして使えるようにする。
dsl を提供しているメソッド task namespace をオーバライドする。


RakeCompat を include したコンテキストで task を定義することで、Thorのコマンドとなる。

```ruby
class Default < Thor
  include Thor::RakeCompat
```

### task

元の処理に加えてインスタンスメソッドを定義することでコマンドにしている。
