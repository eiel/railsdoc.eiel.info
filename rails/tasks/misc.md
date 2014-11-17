---
title: task Misc
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/tasks/misc.rake)

### rake secret

秘密鍵を生成するタスク。標準出力に表示される。

### rake about

アプリケーションの情報を表示する。
仕様するjavascriptのランタイムなんかも表示される。

### rake time:zones:all

仕様できるタイムゾーンの一覧を出力する。

日本は

* Osaka
* Sapporo
* Tokyo

が用意されている。

### rake time:zones:us

アメリカのタイムゾーンの一覧を出力する。

### rake time:zone:local

現在の時刻から該当するタイムゾーンの一覧を出力する。
環境変数 OFFSET で自分でオフセットを指定することも可能。
