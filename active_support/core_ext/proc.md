---
title: Core Ext Proc
---
ActiveSupport 拡張で追加される Proc のメソッド
================================================================================


試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/proc.rb)

deprecated になっている Proc#bind メソッドしかありません。
