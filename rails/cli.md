---
title: Rails::Cli
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc1
```


* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc1/railties/lib/rails/cli.rb)

raisのコマンドラインインターフェイスを起動する。

ruby -r rails/cli

とすると rails コマンドを入力したような出力がかえってくる。

ソースコード中に require 'rails/ruby_version_check' をしている部分があるけど、ここからはもどってこないことがある点に注意。
