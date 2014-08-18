---
title: Thor::Base
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/v0.19.1/lib/thor/base.rb)

Thor::Base
---

### #initialize

* initialize(args = [], local_options = {}, config = {})

args や options を構築する。

引数args は設定されている値のチェックなどもされる。

引数 config からは command_options, current_command, class_optionsが利用される。

### .included

Thor::Baseが include されたクラスに Thor::Base::ClassMethod を extend して Thor::Invocation Thor::Shell を include する。

### .subclasses

コマンドになるクラスを格納しておく @subclasses へのアクセッサ。
[Thor](/thor) または [Thor::Group](/thor/group) を継承したクラスが格納される。

###.subclasse_files

ファイルパスがクラスにマッピングされたHashを返す。

### register_klass_file

* register_klass_file(klass)

バックトレースから呼び出したメソッドのあるファイルを特定して klass を sublcasses や subclases_files を登録する。

Thor::Base::ClassMethods をextendしたクラスが継承された時に呼ばれる。(つまり、Thor や Thor::Group)


Thor::Base::ClassMethods
---

Thor::Base を include したクラスに追加されるクラスメソッド。
DSLを提供する。

### .attr_reader

attr_reader を上書きして、コマンドにならないようにしている。

### .attr_writer

attr_writer を上書きして、コマンドにならないようにしている。

### .check_unknown_options!

`@check_unknown_options` を true にする。

### .check_unknown_options

`@check_unknown_options` を親クラスの値をセットする。ない場合は false にする。

### .check_unknown_options?

* check_unknown_options?(config)

引数 config は無視される。 `@check_unknown_options` をみて true か folse を返す。

### .stop_on_unknown_option?

* stop_on_unknown_option?(command_name)

command_name は無視されて false を返す。
true の場合は知らないオプションがある場合、停止する。

### .strict_args_position!

`@strict_args_position` を true にセットする。

余った引数を使わない設定になります。

### .strict_args_position

`@strict_args_position` を親クラスの値にセットする。ない場合は false にする。

### .strict_args_position?

* strict_args_position?(config)

`strict_args_position` の値をみて true か folse を返す。config の値は利用されない。

### .argument

* argument(name, options = {})

引数の設定を行う。

オプションには、

* :desc
* :required
* :optional
* :typ
* :default
* :banner

を設定できる。

[Thor::Argument](/thor/argument)のインスタンスが arguments に追加される。

### .argments

Thor::Argument のリストを返す。
親クラスから値を引き継ぎする。

### .class_options

* class_options(options = nil)

同じクラス内のコマンドで利用できるオプションを登録する。

### .class_option

* class_option(name, options = {})

name コマンドのオプションの設定をする。

オプションは

* :desc
* :required
* :default
* :group
* :aliases
* :type
* :banner
* :hide

を設定できる。

グループオプションは表示する際のグループの設定。

### .remove_argument

* remove_argument(*names)

引数に指定した名前の引数を削除する。オプションで undef: true を指定するとメソッドの undef をする。

使いどころがよくわかっていない。

### .remove_class_option

* remove_class_option(*names)

引数に指定したオプションを削除する。

### .group

グループの設定をする。
デフォルトは standard になる。

### .commands

[Thor::CoreExt::OrderedHash](/thor/core_ext/order_hash) でコマンドを格納しておく。

### .all_commands

親クラスのものを含めてすべてのコマンドを返す。
戻り値は[Thor::CoreExt::OrderedHash](/thor/core_ext/order_hash)

### .remove_command

* remove_command(*names)

引数names に指定したコマンのを削除する。
`undefine: true `を指定するとメソッドの削除も行なわれる。

### .no_commands

@no_commands を一時的に true にしてブロックを実行する。

メソッドを追加する時にコマンドにならないようにできる。

### .namespace

* namespace(name = nil)

namespace を設定します。nilの場合はクラス名から生成します。

### .start

* start(given_args = ARGV, config = {})

コマンドを実行する。

やることは config[:shell] に Thor::Base.shell.new をセットした上で given_args をコピーして dispatch する。
dispatch は Thor や Thor::Group で実装されており、クラスのインスタスを作成して invoke メソッドを呼びだす。

### .public_command

* public_command(*names)

引数 names で指定した親クラスのメソッドをコマンドに変える。

### .handle_no_command_error

* handle_no_command_error(command, has_namespace = $thor_runner)

コマンドがみつからなかった場合の処理が実装されています。

### .handle_argument_error

* handle_argument_error(command, error, args, arity)

引数にエラーがあた場合の処理が実装されています。

### .class_options_help

クラスオプションのヘルプを生成する処理が実装されています。

### .print_options

オプションのヘルプを生成する処理が実装されていて、class_options_help でも利用されています。

### .is_thor_reserved_word?

* is_thor_reserved_word?(word, type)

Thor で予約されれいるメソッドかどうか判断する。
予約されている場合は失敗する。

### .build_option

* build_option(name, options, scope)

引数のname オプション作成して scope に設定する。

### .build_options

* build_options(options, scope)

options を解析して、scope に設定する。

### .find_and_refresh_command

* find_and_refresh_command(name)

name からこのクラスのコマンドを探す。

### .inherited

`.register_klass_file` を呼び出しして、 `@no_command` を false に設定する。

### .method_added

* method_added(meth)

meth を追加された時に呼ばれる処理。コマンドとして登録できるのか確認などがされる。

### .from_superclass

* from_superclass(method, default = nil)

親クラスが引数 method を実行できる場合はその値を、ない場合は引数 default の値を返す。

### .exit_on_failure?

失敗した時に収量するかどうか。
デフォルトは false

### .basename

コマンドのベースネームの文字列を返します。


### .baseclass

子クラスで実装します。

### .create_command

子クラスで実装します。


### .initialize_added

子クラスで実装します。

initializer を設定した時に呼ばれる処理です。

### .dispatch

子クラスで実装します。

コマンドを invoke する処理を書きます。
