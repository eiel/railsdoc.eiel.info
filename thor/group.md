---
title: Thor::Group
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/v0.19.1/lib/thor/group.rb)

このクラスを継承するとコマンド作成ができる。
継承してコマンドを作成するには [Thor](/thor) もあるが、 Thor と違う点は定義されているメソッドをすべて実行する。

ひとつの複雑なコマンドを作成すると考えればよさそう。

Thor::Group は Rails の Generator でも利用されている。

* [参考](https://github.com/erikhuda/thor/wiki/Groups)

Thor::Group
---

### .desc

* desc(description = nil)

コマンドの説明を設定する。
nil の設定した場合は

### .help

* help(shell)

shell に対し help を出力する。

### .invocations

親クラスの invocations の値を引き継ぐ。ない場合は空のハッシュがデフォルト値。

invoke または invoke_from_option によって生成された名前を記録する。
値がtrue の場合は invoke_from_option で生成されたもの。

### .invocation_blocks

親クラスの invocation_blocks の値を引き継ぐ。ない場合は空のハッシュがデフォルト値。invoke する際に実行するブロックが保存される。

### .invoke

* invoke(*names, &block)

引数names に指定したの invoke するためのインスタンスメソッドを生成する。

`_invoke_#{name}` な名前のメソッドが生成される。

### .invoke_from_option

クラスオプションによって別のコマンドを実行するためのインスタンスメソッドを生成する。

`_invoke_from_option_#{name}` な名前のメソッドが生成される。

### .remove_invocation

invoke で作ったものを削除する。

### .class_options_help

元の処理をオーバライドしてグループオプションのマージした上で、元の処理を行う。

### .get_options_from_invocations

* get_options_from_invocations(group_options, base_options)

invocations に登録されているものからオプションを取得する。
引数の group_options に取得される。

ブロックを渡して再帰風にチェックできる模様。

### .printable_commands

引数は特に利用しない。 Thor::Group だからだと思う。

bannarとdesc の情報をリストでラップするだけ。

### .handle_argument_error

* handle_argument_error(command, error, args, arity)

引数エラーのメッセージを作成し、出力する。

### .dispatch

* dispatch(command, given_args, given_opts, config)

[invoke_all](/thor/invocation) や [invoke](/thor/invocation) を呼ぶ。
コマンドの指定がない場合にallなる。


### .banner

ヘルパなどで使用するバナー文字列を返す。
basenameと使い方で構成されてる。

### .self_command

[Thor::DynamicCommand](/thor/dynamic_command)のインスタンスを返す。

### .baseclass

Thor::Group を返すようになっています。


### .create_command

* create_command(meth)

引数meth を [Thor::Command](/thor/command)のコンストラクタの第1引数に渡して commands に meth 名をキーに格納する。

### #_invoke_for_class_method

invoke メソッドで生成されたメソッドが使う。`#invoke` メソッドを実行するが、ブロックがある場合は独自の処理になる。
