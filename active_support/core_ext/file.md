---
title: Core Ext File
---
ActiveSupport 拡張で追加される File のメソッド
================================================================================

試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc1
```

File へ機能を追加する方法

```ruby
require 'active_support/core_ext/file'
```

Atomic
--------------------------------------------------------------------------------

ファイルへアトミックに書き込みをするメソッド `.atomic_write` が実装されている

この機能だけ読込みするには

```ruby
require 'active_support/core_ext/file/atomic'
```

とします。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/file/atomic.rb)

### .atomic_write

* .atomic_write(file_name, temp_dir = Dir.tmpdir)

別のスレッドやプロセスに割り込みされずに書き込みしたい場合に使用する。

引数tmep_dir に一旦ファイルを作成し、保存後に 引数file_name と差し替えをする仕組みになっている。

### .probe_stat_in

* .probe_stat_in(dir)

`.atomic_write` で使用される。
private メソッド的扱い。
直接使用するのはおすすめできない。

引数dir でファイルを作成し、ファイルのパーミションを取得する。
