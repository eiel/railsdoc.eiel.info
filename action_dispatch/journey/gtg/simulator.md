---
title: ActionDispatch::Journey::GTG::Simulator
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/gtg/simulator.rb)


[TransitionTable](action_dispatch/journey/gtg/transition_table) を受取りシミュレータを構築する。
`Simulator#simulate(string)`メソッドにでシミュレートし、マッチすれば node に設定された memo を含んだActionDispach::Journey::GTG::Metadata のインスタンスを返す。
