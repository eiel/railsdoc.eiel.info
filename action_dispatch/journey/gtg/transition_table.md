---
title: ActionDispatch::Journey::GTG::TransitionTable
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.2/actionpack/lib/action_dispatch/journey/router.rb)

memos はデフォルトの値が空のリストの Hash


ActionDispatch::Journey::GTG::TransitionTable
--------------------------------------------------------------------------------

### add_accepting

* add_accepting(state)

`@accepting[state] = true` と設定する。
true にしかセットできない。

### accepting_states

@accepting に記録されている key の一覧を返す。

### accepting?

* accepting?(state)

state がセットされているか確認する。

### add_memo

*  add_memo(idx, memo)

idx をキーにメモを追加する。同じ idx に複数メモを追加できる。

### memo

* memo(idx)

idx をキーに保存したメモをとりだす。リストが返る。

### eclosure

* eclosure(t)

eclosure という単語もないし、なんだろう。

t のリストに変換して返す。

### move

* move(t, a)


move という名前だけど、副作用はない模様。
`@string_states`、 `@regexp_states` から値を取り出す。
Hash の Hashのような構造になってる模様。

### to_json

json に変換する。

`@regexp_states`, `@string_states`, `@accepting` をダンプする。
`@regexp_states は変換処理が入る。

### to_svg

svg に変換する。DOT言語を経由する。

### visualizer

HTMLを作成する。CSSや必要なJavaScriptも。

### []=

* []=(from, to, sym)

`@string_states`、`@regexp_states`のどちらかに値を代入する。

### states

