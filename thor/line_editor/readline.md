---
title: Thor::LineEditor::ReadLine
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/line_editor/readline.rb)

[Thor::LineEditor::Basic](/thor/line_editor/basic) を継承して ReadLine に対応している。

使えるかどうか Readline を読み込めているかどうかで判断される。

readline メソッドを上書きしている。
使えるオプションも :add_to_history :limited_to :path も設定できる

:path は パスの補完ができる。

Thor::LineEditor::PathCompletion
---

パスの補完機能を提供する。グロブパターンも対応している。
