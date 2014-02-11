---
title: ActionDispatch::Nodes::Node
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.2/actionpack/lib/action_dispatch/journey/nodes/node.rb)

Parser で利用する Node が定義されてる。ActionDispatch::Journey::Nodes::Nodeをベースに

* Terminal
* Symbol
* Literal
* Dummy
* Symbol
* Slash
* Dot
* Symbol
* Unary
* Group
* Stare
* Binary
* Cat
* Or

多くの node が type をオーバライドしてるだけ。

to_dot メソッドがある。気になる。

Binary と Or 以外は 次の Node は left のみの単方向リストになる。
Binary は right を持ち、OR は left がなく複数の子を持つ。
