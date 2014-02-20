---
title: ActionDispatch::Journey::NFA::TransionTable
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/nfa/transition_table.rb)

ActionDispatch::Journey::NFA::TransionTable
--------------------------------------------------------------------------------

accepting は attr_accessor になっている。[GTG](actiondispatch/journey/gtg/tarnsition_table) のほうはアクセスできなかった。

memos は同様に attr_reader です。

### accepting?

* accepting?(state)

state が @accepting と一致するか確認するだけになっている。

### accepting_states

複数系になっている。リストに持ち上げた accepting が返る。

### add_memo

* add_memo(idx, memo)

@memos[idx] に memo を記録する。上書きする。


### memo

* memo(idx)

@memo[idx] をかえすだけ。


### []=

* []=(i, f, s)

`@table[f][i]` に s を設定する

### merge

* merge(left, right)

memo と table の値を left から right へ。

### states

@tablesのキー一覧と値の一覧をまとめたものを返す。

### generalized_table

[GTG::TransitionTable](action_dispatch/journey/gtg/transistion_table) に変換してそれを返す。


### following_states

* following_states(t, a)

テーブルの `a` 列の値を返すような実装になってる。


### move

* move(t, a)

move だけど副作用はない感じ。


### alphabet

正直よくわからない。
