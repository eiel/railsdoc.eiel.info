---
title: ActionView::LogSubscriber
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionview/lib/action_view/helpers/active_model_helper.rb)

ActionView::Helpers::ActiveModelHelper
--------------------------------------------------------------------------------

中身がない。なんでだろう。

ActionView::Helpers::ActiveModelInstanceTag
--------------------------------------------------------------------------------

### object

super クラスから object メソッドにアクセスして to_model で モデルに変換して `@active_model_object` に保存する。

### content_tag

super を実行して error_wrapping に丸投げする。

### tag

* tag(type, options, *)

super を実行して error_wrapping に丸投げする。
`optinos['type']` が hidden の場合は丸投げにされない。

### error_wrapping

* error_wrapping(html_tag)

エラーがある場合は ActionView::Base.field_error_proc を通してエラー情報が不可される。
`Proc.new{ |html_tag, instance| "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe }` という実装になってる。

### error_message

エラーメッセージにアクセスするためのヘルパー
たぶん、for_for の中で使える。
