---
title: Rails::InfoController
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc1/railties/lib/rails/info_controller.rb)

ローカルでのみで表示されるアクションを提供する。

ルーティングを表示する Info#routes と環境情報を表示する Info#properties がある。

Info#index は routes にリダイレクトする。
