---
title: ActiveSupport::Duration
---

試した環境

```
$ ruby -v
ruby 2.0.0p195 (2013-05-14 revision 40734) [x86_64-darwin12.3.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc1
```

このファイルを require するファイル

* [active_support/core_ext/integer/time.rb](/active_support/core_ext/integer.md#Time)

コンストラクタ

* initialize(value, part)

インスタンス変数

* @value
* @part

`@value` は 秒数に変更したもの。
`@part` は元々の情報をリストで保存しているようです。

例:

```
require 'active_support/core_ext'
10.months.parts              # => [[:months, 10]]
(10.months + 1.years).parts  # => [[:months, 10], [:years, 1]]
```
