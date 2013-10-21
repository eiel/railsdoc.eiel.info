---
title: ActiveSupport::OrderedHash
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/base.rb))

ActionController と ActionMailer の共通部分をまとめたクラス。Controllerとして機能するための機能が実装されている。
低レベルAPIが実装されていて、このクラスを直接使うべきではない。
継承して render メソッドを提供して使うことになる。

あらかじめ erubis が require されているあたりから Controller が View と結びつくものとわかる。

AbstractController::ActionNotFound
--------------------------------------------------------------------------------
Controller は process メソッドにアクション名を渡して利用することになる。
この際にアクション名に一致するアクションがない場合に発生する例外。

AbstractController::Base
--------------------------------------------------------------------------------
@_response_body

### .abstract

抽象クラスかどうかを示すフィールド。確認する `abstract?` や抽象クラスにする`abstract!`などもある。
`AbstractController::Base` を継承すると `abstract` は `false` になります。


### .config

9ActiveSupport::Conifgulable](/active_support_configration) を includeしているので AbstractController::Base.config に設定を保存できます。

### .internal_methods

内部メソッドを返す。Controller のインスタンスメソッドはアクションとされるので、これと分離するために存在すると予想される。
抽象クラスであれば自身の public なインスタンスメソッドの一覧を返し、そうでない場合は、親クラスの public なインスタンスメソッドを返す。

ドキュメントには最初の抽象クラスのメソッドと係れているので、実装と相違があるように見えるけどよくわからない。

### .hidden_actions

隠されたアクションの一覧を返す。デフォルトでは空リスト。

### .action_methods

アクションの一覧を文字列の Set を返す。
基本的には public メソッドを返す。 hidden_actions に追加されているものは返さない。
また、`_one_time_conditions` という設備がついているのは ActiveSupport Callback によって追加されるメソッドなので表示されない。

継承したクラスで使う必要がある。

### .controller_path

Rails 的にいうと、Controller の app からの相対パスを返すメソッド。

### .method_added

メソッド追加した時に action_methods の結果を更新するためのメソッド

### #process

* process(action, *args)

引数 `action` を実行する。`args` にはメソッドへの引数として使われる。
action が存在しない場合は ActionNotFound 例外が発生する。

### #controller_path

`.controller_path` へ委譲するので同じものを返す。

### #action_methods

`.action_methods`  へ委譲するので同じものを返す。

### #action_method?

* action_method?(name)

引数 name がアクションかどうか確認する。

### available_action?

* available_action?(action_name)

引数 `action_name` が利用可能なアクションか確認する。
アクションのメソッドがない場合でも action_missing というメソッドがあれば true を返す。

### response_body

`process` を実行した結果の情報を保持するプロパティ

### action_name

`process` で実行したアクションを保持するプロパティ

### formats

対応してる format を返すのではないかと思うけど、このクラス内では利用されてないのでよくわからない。
