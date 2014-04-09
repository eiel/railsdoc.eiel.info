---
title: ActionView::Helpers::ControllerHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionview/lib/action_view/helpers/controller_helper.rb)

Controller の情報を View で使うための Helper。
assign_controller でコントローラとの紐付けを行う。

controller にアクセスできるだけでなく

* request
* config
* request_forgery_protection_token
* params
* session
* cookies
* response
* headers
* flash
* action_name
* controller_name
* controller_path

にアクセスできる。
