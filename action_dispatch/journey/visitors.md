---
title: ActionDispatch::Journey::Visitors
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/visitiors.rb)

[ActionDispatch::Journey::Nodes::Node](action_dispatch/journey/nodes/node) を探査するビジターが定義されている。

ActionDispatch::Journey::Visitors::Visitor をベースにすべての Node ごとに同じ処理を追加できる Each、文字列へと変換する String、文字列からグループの情報を省いた OptimizedPath, url_for のための Formatter, DOT言語のための Dot のVisitor が用意されている。
