---
title: task Tmp
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/tasks/tmp.rake)

`rake tmp:clear`を提供する。

* tmp:sessions:clear
* tmp:cache:clear
* tmp:sockets:clear

の3つをまとめて提供する。

* tmp:pids:clear

も提供する。
それぞれtmpディレクトリの該当ファイルを削除する。
