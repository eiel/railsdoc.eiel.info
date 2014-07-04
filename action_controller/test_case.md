---
title: ActionController::TestCase
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/actionpack/lib/action_controller/test_case.rb)


ActionController::TemplateAssertions
--------------------------------------------------------------------------------


通知 `render_template.action_view` に反応して、layout や partial した path と数をカウントしておいて、assert_template でレンダリングしたファイルを確認することができる。

ActionController::TestRequest
--------------------------------------------------------------------------------

ActionDispatch::TestRequest を継承していて assign_parameters を使うと params の値を調整することができるっぽい。


ActionController::TestSession
--------------------------------------------------------------------------------

id はランダムに生成されるテスト用のセッション。

ActionController::TestCase
--------------------------------------------------------------------------------

Controller を Test を行う際に継承して使うクラス。

### #get

action を get できる。類似として post patch put delete head がある。

### #xml_http_request

xhr できる。

ActionController::TestCase::Behavior
--------------------------------------------------------------------------------

### .tests

テストするコントローラ名を指定するメソッド。

自動的に決定する能力もある。
