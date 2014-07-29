---
title: Thor::Shell
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/shell.rb)

### Thor::Shell

[Thor](/thor) や [Thor::Group](/thor/group) にミックインされるモジュールで shell の環境決める。

shell には

* [Thor::Shell::Basic](thor/shell/basic)
* [Thor::Shell::Color](thor/shell/color)
* [Thor::Shell::HTML](thor/shell/html)

があり、デフォルトでは環境に応じて Basic か Color が選択される。
コンストラクタの引数やTHOR_SHELLオプションなのでも設定できる。

選択されたクラスへのインスタンスへプロキシもする。

### Thor::Base.shell

shell として使うクラスを選択して `@shell` へ保存してそれを返す。

### #initialize

* initialize(args = [], options = {}, config = {})

config[:shell] で config[:shell] に対する処理を追加する。

### #shell

シェルクラスのインスタンスを返す。
未設定の場合は生成して保存する。

## with_padding

このメソッドに渡したブロックないで実行するとパディングが追加される。
