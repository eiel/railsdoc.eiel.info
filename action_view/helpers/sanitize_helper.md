---
title: ActionView::Helpers::SanitizeHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/sanitize_helper.rb)

サニタイズは `<` `>` などを実体参照におきかえたり、情報を正しく受け取れるように変換する。

ActionView::Helpers::SanitizeHelper
--------------------------------------------------------------------------------


### sanitize

* sanitize(html, options = {})

引数 html をタグに含まれる不要な属性を排除してくれる。
実体参照へのおきかえは html_safe が担当しているので、そこの部分は特になにもしてない。

### sanitize_css(style)

* sanitize_css(style)

style 部分のサニタイズを行う。HTMLなどを渡すとすべて削除されてしまう。


### strip_tags

* strip_tags(html)

タグを削除してテキストだけにします。

### strip_links(html)

* strip_links(html)

リンクタグを削除しまます。
