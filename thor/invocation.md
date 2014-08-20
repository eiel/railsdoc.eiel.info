---
title: Thor::Invocation
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/invocation.rb)

Thor::Invocation
---

モジュール。Thor::Base をミックスインしたクラスにミックスインされる。
[Thor::Group](/thor/group) や [Thor](/thor) などが該当。

invoke メソッドを提供するのが主な目的

### .prepare_for_invocation

* prepare_for_invocation(key, name)

name が文字列かシンボルである場合 `Thor::Util.find_class_and_command_by_namespace` を呼ぶ。

### #initialize

* initialize(args = [], options = {}, config = {}, &block)

config に含まれる @_invocations をインスタンス変数に保存する。

### #current_command_chain

@_invocations に保存された値の一覧を返す。
名前から推察するにコマンドが繋がる一覧になると考えられる。

### #invoke

* invoke(name = nil, *args)

name が nil の場合は invoke_all が実行される(deprecated)

name はコマンドの名前でコマンドを実行できる。
後ろにつづく引数がコマンドの引数になり、ハッシュを渡すとオプションになる。

最後はクラスの `dispatch` メソッドを呼び出しをする。
parent_option として、コンストラクタから渡されたオプションを引き継ぎするようだ。

### #invoke_command

自分自身のもつコマンドを実行する。

### #invoke_all

自分自身がもっているコマンドをすべて実行する

### #invoke_with_padding

padding を追加して invoke を実行する。
[Thor::Shell](/thor/shell)#with_paddingを使う。
