---
title: ActionDispatch::Assertions::TagAssertions
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/testing/assertions/tag.rb)

テストコードをかくためのアサーションが実装されている。
このファイルはタグに関するものが実装されている。

ActionDispatch::Assertions::TagAssertions
--------------------------------------------------------------------------------

### assert_tag

* assert_tag(*opts)

オプションを利用して find_tag してなにかみつかるかどうかで動作チェックする。

## assert_no_tag

* assert_no_tag(*opts)

assert_tag の逆。

### find_tag

* find_tag(conditions)

conditions を満たす tag をひとつ探す。

### find_all_tag

* find_all_tag(conditions)

conditions を満たす tag をひとつ探す

### html_document

HTML::Document をつくって保持しとくメソッド。
