---
title: ActionDispatch::Assertions::DomAssertions
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/testing/assertions/dom.rb)

テストコードをかくためのアサーションが実装されている。
このファイルはDOMに関するものが実装されている。

ActionDispatch::Assertions::DomAssertions
--------------------------------------------------------------------------------

### assert_dom_equal

*** assert_dom_equal(expected, actual, message = nil)

Domとみなして expected と actual が等しいかどうか確認する。

### assert_dom_not_equal

*** assert_dom_not_equal(expected, actual, message = nil)

Domとみなして expected と actual が等しくないかどうか確認する。
