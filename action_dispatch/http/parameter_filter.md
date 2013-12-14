---
title: ActionDispatch::HTTP::ParameterFilter
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/parameter_filter.rb)

特定のパラメータを読まれないようにした状態に変換したパラメータを作成します。

ParameterFilterクラスを作成する際に隠したいパラメータ名を設定し、`filter` メソッドにパラメータを渡すとパラメータの一部を隠すことができます。
ログに出力する際に利用されます。
