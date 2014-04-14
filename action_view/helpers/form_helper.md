---
title: ActionView::Helpers::FormHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/form_helper.rb)

form_for とその中で使えるメソッドが定義されています。
ブロックの引数には Builder が入ります。これは options[:builder] で指定することもできます。
デフォルトでは ActionView::Helpers::FormBuilder が指定されます。

builder は `builder.new(object_name, object, self, options)` という形式で初期化されます。
