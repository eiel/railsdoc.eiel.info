---
title: ActionDispatch::Journey::NFA::Simulator
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/journey/nfa/simulator.rb)

ActionDispatch::Journey::NFA::MatchData
--------------------------------------------------------------------------------

[GTG::MatchData](action_dispatch/journey/gtg/simulator) と違いはない。

値を memos を保存するだけ。

ActionDispatch::Journey::NFA::Simulator
--------------------------------------------------------------------------------

[GTG::Simulator](action_dispatch/journey/gtg/simulator) と大きな違いはなく、NFA用に修正させれている。
結果は MatchData になって返る。
