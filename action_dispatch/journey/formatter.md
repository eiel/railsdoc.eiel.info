---
title: ActionDispatch::Journey::Formatter
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/formatter.rb)

[ActionDispatch::Journey::Routes](action_dispatch/journey/routes)のインスタンスを渡して作成し、generate メソッドによって、URLとパラメータを返します。
結果となるURLと残ったURLに利用しなかったパラメータが返るようです。

見つからない場合は ActionController::UrlGeneratianErrorが発生します。

cache 機能が組み込まれてクリアすりには clear メソッドがあります。
