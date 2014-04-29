---
title: ActionView::Helpers::UrlHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/url_helper.rb)

ActionView::Helpers::UrlHelper
--------------------------------------------------------------------------------

### url_for

routes で機能強化されるため特に機能がない。
第1引数に :back といれておくと HTTP_REFERRERヘッダーからひとつ前のURLを設定する。
それがない場合は `history.back()` となる。

### link_to

url_for をつかって href を作成して a タグを生成するヘルパー


### button_to

ボタンをつくるヘルパーだけど必要に応じてフォームになる。

### link_to_unless_current

今表示しているページの場合はリンクにならない link_to 便利そう。

### link_to_unless

第1引数が false になる場合はリンクにならない Link_to。

### link_to_if

第1引数が true になる場合はリンクになる link_to

### mail_to

mail_to を作成するヘルパ

### current_page?

* current_page?(options)

options で構築されるURLが現在のページが判断する。
