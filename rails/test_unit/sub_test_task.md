---
title: Rails::TestUnit::SubTestTask
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/test_unit/sub_test_task.rb)

Rails::TestTask
---

`Rails::TestTask::TestCreator` クラスに `Rails::TestTask::TestInfo` を渡して生成することができるけど、これといって機能は追加されていない `Rake::TestTask`


Rails::TestTask::TestCreator
---

コンストラクタでRails::TestTask::TestInfoのインスタンスをうけとる。
TestInfoにファイル情報がない場合は test:single または test:run タスクを実行する。
ある場合は test:single タスクを生成して実行する。

Rails::TestTask::TestInfo
---

コマンドラインの情報やらをうけとり実行するテストの情報を管理するクラス。

Rails::SubTestTask
---

desc を無視するようにした Rails::TestTask
