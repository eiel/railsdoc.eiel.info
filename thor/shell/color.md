---
title: Thor::Shell::Color
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/shell/color.rb)

[Thor::Shell::Basic](/thor/shell/basic) を継承して色をつける機能がついてる。
set_color と show_diff オーバライドしている。

Thor::Shell::Color
---


### set_color

* set_color(string, *colors)

色を付与した文字列を作成する。

colors には複数色を指定できる。foreground用の色やbackground用の色があるため複数指定できる。第3引数に true をいれるとボールドになったりする。


### show_diff

* show_diff(destination, content)

Diff::LCL を使い diff を生成する。 THOR_DIFF, RAILS_DIFF を設定すると無効化できる。
