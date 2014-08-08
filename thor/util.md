---
title: Thor::Util
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/util.rb)

Thor のユーティリティが定義されている。

代表されるのは

* .namespace_from_thor_class
* .load_thorfile

メソッドのようだ。

Thor::Sandbox
---

.load_thorfile がこのモジュールの class_eval で実行される。

Thor::Util
---

### .find_by_namespace

* find_by_namespace(namespace)

Thor::Base を派生しているクラスから namespace に該当するクラスを探す。

引数 namespace は文字列で、`:` を含まない場合 default が付与される。

### .namespace_from_thor_class

定数を thor の名前空間に変換する。

```ruby
Thor::Util.namespace_from_thor_class(Foo::Bar::Baz) #=> "foo:bar:baz"
```

Thor::Sandbox:: を削除する機能をもってる。

### .namespaces_in_content

* namespaces_in_content(contents, file = __FILE__)

contents を load_thorfile して、SandBoxに読み込みしたクラスの一覧を返します。

### .thor_classes_in

* thor_classes_in(klass)

klass 内にある Thor::Base のサブクラスを探す。

### .snake_case

文字列をスネークケースにするだけ

### .camel_case

文字列をキャメルケースにするだけ

### .find_class_and_command_by_namespace

* find_class_and_command_by_namespace(namespace, fallback = true)

namespace から クラスとコマンド名を取り出します。

### .load_thorfile

* load_thorfile(path, content = nil, debug = false)

Thor::SandBox のクラスコンテキストで、ファイルを読み込みする。
content があればそれを評価して、ない場合はpathを読み込みします。

Thor::Util.load_thorfile("~/.thor/foo")

### .user_home

ユーザのホームディレクトリを探します。

### .thor_root

Thor の 設定ファイル ~/.thor を返します。

### .thor_root_glob

.thor ディレクトリ内のファイル一覧を取得します。
ディレクトリの場合は そのディレクトリの main.thor を探すようです。

### .globs_for

* globs_for(path)

path を基点に Thorfile *.thor tasks/*.thor lib/tasks/*.thor の一覧を返します。

### .ruby_command

実行している Ruby のファイルパスを返します。

### .escape_globs

`*` `?` `{` `}` `[` `]` といった文字列をエスケープします。
