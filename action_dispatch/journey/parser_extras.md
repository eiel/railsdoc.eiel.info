---
title: ActionDispatch::Journey::Parser
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.2/actionpack/lib/action_dispatch/journey/parser_extras.rb)

ActionDispatch::Journey::Scanner をつかったパーサが定義を定義されている。
Racc::Parser をつかっている。parseメソッドとnext_tokenメソッドはオーバライドする必要がそもそもある。
