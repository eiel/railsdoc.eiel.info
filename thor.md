---
title: Thor
---

* [Thor::Base](/thor/base)
* [Thor::Command](/thor/command)
* [Thor::CoreExt::HashWithIndifferentAccess](/thor/core_ext/hash_with_indifferent_access)
* [Thor::Invocation](/thor/invocation)
* [Thor::Shell](/thor/shell)
* [Thor::Shell::Basic](/thor/shell/basic)
* [Thor::Util](/thor/util)
* [Thor::Actions](/thor/actions)

Parser
---

* [Thor::Argument](/thor/parser/argument)
* [Thor::Arguments](/thor/parser/arguments)
* [Thor::Option](/thor/parser/option)
* [Thor::Options](/thor/parser/option)

Thor
---

[Thor::Base](/thor/base) を include していて、定義したメソッドがコマンドになるクラス。継承して使う。

### .package_name

パッケージ名を指定する。

### .default_command

デフォルトコマンドを指定する。指定しない場合は help になる。

### .register

* register(klass, subcommand_name, usage, description, options = {})

別クラスに登録されているコマンドを自分のクラスに登録できる。
サブコマンドとして登録されます。

### .desc

次につづくメソッド定義で生成されるコマンドの説明を設定できます。
インスタンス変数に保存しておくことで実現する。

forオプションで明示的にコマンドを指定することもできる。

### .long_desc

次につづくメソッド定義で生成されるコマンドの詳細の説明を設定できます。

### .map

コマンドのショートカットを設定できます。

### .method_options

コマンドのオプションを定義できます。

### .method_option

つづくコマンドのオプションを定義できます。
内部で method_options を使用している。

for オプションを指定することで、明示的にコマンドを指定できる。

### .command_help

* command_help(shell, command_name)

引数shell に 引数command_name のヘルプを出力します。

### .help

* help(shell, subcommand = false)

引数shell にヘルプを出力します。
引数subcommand を true に設定するとサブコマンドも出力されます。

### .printable_commands

* printable_commands(all = true, subcommand = false)

コマンドの一覧を返します。
引数all が true であれば親クラスがもつコマンドも含まれます。

### .subcommands

サブコマンドの一覧を返します。

### .subcommand_classes

サブコマンドになっているクラスの一覧を返します。

### .subcommand

* subcommand(subcommand, subcommand_class)

subcommand を登録するメソッドです。

### .check_unknown_options!

* check_unknown_options!(options = {})

引数options に値のないオプションがある場合排除します。

### .check_unknown_options?

config に except や only に値を入れておくことで 現在のコマンドと比較して true か false を返し、チェックするかどうかを判断できる。

### .stop_on_unknown_option!

知らないオプションがあった場合に停止するコマンドを登録できます。

### .stop_on_unknown_option?

知らないオプションがあるときに停止するかどうか確認できます。

### .stop_on_unknown_option

`@stop_on_onknow_option の中身を変えします。

### .dispatch

コマンドを実行できます。

インスタンスを作成して invoke_commandを利用してコマンドを実行します。

### .banner

banner を作成します。
help なんかで使えます。

### .baseclass

Thor を返します。

### .dynamic_command_class

Thor::DynamicCommand を返します。

### .create_command

* create_command(meth)

引数meth のメソッドを使い、コマンドを作成します。

### .initialize_added

初期化の追加処理か定義されている模様。

### .retrieve_command_name

* retrieve_command_name(args)

引数argsからコマンド名を取り出します。

### .normalize_command_name

* normalize_command_name(meth)

エイリアスの場合などもあるので、コマンド名を本来の名前に変換します。
みつからない場合はデフォルトのコマンド名になります。

### .find_command_possibilities

* find_command_possibilities(meth)

meth がみつけられるコマンドを返します。

一致するものがあればすれを返し、ない場合似たものがあればそれ返します。

### .subcommand_help

サブコマンドのヘルプを生成するメソッドです。

### #help

ヘルプコマンドのデフォルトの実装です。
