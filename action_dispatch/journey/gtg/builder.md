---
title: ActionDispatch::Journey::GTG::Builder
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/gtg/builder.rb)

[TransitionTable](action_dispatch/journey/gtg/transition_table) を作成する責務を持つ。

ActionDispatch::Journey::GTG::Builder
--------------------------------------------------------------------------------

### transition_table

[TransitionTable](action_dispatch/journey/gtg/transition_table) を構築する。
Nodeの情報を用いてテーブルを作成する。

### nullable?

* nullable?(node)

node が nullable か確認する。GroupやStar に辿りつけば trueになる。Terminal に辿りついた場合 left があれば false となる。

### firstpos


firstpos を探す。
見た感じ Terminal なノードのリストが変えってくる感じにみえる。

### lastpos

lastpos を探す。
見た感じ Terminal なノードのリストが変えってくる感じにみえる。
firstpos とは一部左右が違う。

### followpos

Cat と Star のlastposの左を基点に firstpos を探してテーブルを作成。基点のnodeを渡すとfirstpos を返してるようにみえる。
