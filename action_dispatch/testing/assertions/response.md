---
title: ActionDispatch::Assertions::Response
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/testing/assertions/response.rb)

ActionDispatch::Assertions::ResponseAssertions
--------------------------------------------------------------------------------

### assert_response

* assert_response(type, message = nil)

type には 数値かシンボルが指定できる。

`@response.response_code` の戻り値を比較します。

### assert_redirected_to

* assert_redirected_to(options = {}, message=nil)

assert_response でリダイレクトを確認したあとに追加で options に指定されているリダイレクト先を確認します。
