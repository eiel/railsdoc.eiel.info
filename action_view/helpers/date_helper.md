---
title: ActionView::Helpers::DateHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/date_helper.rb)

日付に関連するヘルパーが定義されています。

ActionView::Helpers::DateHelper
--------------------------------------------------------------------------------

### distance_of_time_in_words

* distance_of_time_in_words(from_time, to_time = 0, options = {})

from_time から to_time までの期間を言葉で表現してくれる。
i18n 対応可能。全部対応するのはなかなか大変。


### time_ago_in_words

distance_of_time_in_words の to_time を Time.now にしたバージョン。

### date_select

* date_select(object_name, method, options = {}, html_options = {})

Tags::DateSelect を使い構築する。
