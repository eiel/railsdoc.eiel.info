---
title: ActionDispatch::Journey::NFA::Builder
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/nfa/builder.rb)

Visitor と Builder が定義されている。
Builder は ast をうけとって TransitionTable を作成と Visitor を作り、ast を accept した TransitianTable を返す。

ActionDispatch::Journey::NFA::Visitor
--------------------------------------------------------------------------------

よくわからない。 visit とすると 2要素のリスト [from,to] を返す。

ActionDispatch::Journey::NFA::Builder
--------------------------------------------------------------------------------

TransitionTable を返す。
