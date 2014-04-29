---
title: ActionView::Helpers::TranslationHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/translation_helper.rb)

t メソッドを提供するのが主な目的。

ActionView::Helpers::TranslationHelper
--------------------------------------------------------------------------------

### translate

* translate(key, options = {})

18n.translate のラッパー。省略形として `t` として使える。

key に suffix として `.html` や `_html` をつけると HTML_SAFEな文字列として扱われる。

オプションの raise にクラスをいれておくと translate するときにエラーがおきた時の例外にできる。

オプションのデフォルトに symbol を挿入しておくと translate で変換されるようにラップされる。

### localize

* localize(*args)

localize は日付や時間を変換するのに利用するらしい。
なにもせずに I18n.localize に渡す。
