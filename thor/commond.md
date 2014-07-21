---
title: Thor::Command
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/v0.19.1/lib/thor/command.rb)

コマンドの情報を格納するデータ構造。

name, description, long_description, usage, options といったメンバを持つ。
Thor や Thor::Group の create_command メソッドによって生成される。
Thor はクラスメソッドそのものが命令になるため、このクラスはコマンドの情報をもつだけになる。
このコマンドクラスからコマンドを実行するには該当クラスのインスタンスが必要になる。

Thor::Command
---

Thor::Task という別名もある。

### hidden?

隠しコマンドかどうかを返す。
オーバライドする必要があり、隠しコマンドの場合は Thor::HiddenCommand クラスのインスタンスになっているはずである。

### run

* run(instance, args = [])

引数インスタンスのコマンドを実行する。
実行するメソッドは名前から判断される。

### formatted_usage

フォーマットされた利用方法の出力用の文字列を作成する。

### not_debugging

* not_debugging(instance)

instance のクラスのdebugging が false なら true を返す。

### required_options

必須オプションを options に設定することができそこから必須オプションのリストを返す


Thor::HiddenCommand
---

隠しコマンドの情報を管理すためのデータ構造。

hidden? を true を返すようになっただけ。

Thor::DynamicCommand
---

method_missing によって作成されたコマンド用のクラス？
