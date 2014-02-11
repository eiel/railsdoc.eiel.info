---
title: ActionDispatch::Journey::Path::Pattern
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.2/actionpack/lib/action_dispatch/journey/path/pattern.rb)

strexp を受け取り required_names や optional_names を提供する。
strexp は文字列でも [Router::Strexp](action_dispatch/journey/router/strexp) でもよい。
[Journey::Parser](action_dispatch/journey/parser) を用いて strexp を解析する。

ActionDispatch::Journey::Path::Pattern
--------------------------------------------------------------------------------

### ast

[Journey::Parser](action_dispatch/journey/parser) でパースして Node にしたものに regexp を設定してそれをそのまま返す。


### names

Nodes::Symbal であるものをすべて返す。
URL上の値が入るようにシンボル設定されている部分と思われる。

### required_names

names から optional_names を除いたものを返す。

### optional_names

Nodes::Group に含まれた Node::Symbol なものを返す。
なくても良い値の一覧を返す
