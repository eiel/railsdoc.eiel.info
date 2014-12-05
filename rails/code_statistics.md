---
title: Rails::CodeStatistics
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc1/railties/lib/rails/code_statistics.rb)


コンストラクタにディレクトリの一覧を指定する。
CodeStatisticsCalucuratorをつかって集計をして、出力を生成する。
