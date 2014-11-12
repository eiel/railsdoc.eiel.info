---
title: task engine
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/tasks/engine.rake)

load_app タスクを実行してから db 系のタスクを実行できるようにしてタスクの設定しています。
load_app は Rakefile をよみこみします。

rake db:migrate などはここで定義されていて、

* load_app
* app:db:migarte

と順にタスクが呼ばれます。
