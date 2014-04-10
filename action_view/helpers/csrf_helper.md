---
title: ActionView::Helpers::CsrfHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/csrf_helper.rb)

クロスサイトリクエストフォージェリ対策のためのフォームを作成するタグヘルパーが定義されてる。

Actionview::Helpers::CsrfHelper
--------------------------------------------------------------------------------

### csrf_tags

csrf-param と csrf-token というメタタグを挿入する。
値は request_forgery_protection_token と form_authenticity_token からそれぞれ取得します。

csrf_meta_tag にエイリアスされている。
