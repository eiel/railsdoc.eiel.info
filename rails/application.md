---
title: Rails::Application
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/application.rb)

Railsのコア部。このクラスを継承したクラスがRailsアプリケーションになる。
インスタンスをつくったら`arun_load_hooks!`を呼んでおく必要があるみたい。
シングルトンで、Rails.app_classでクラス名を取得できる。

### .inherited

Rails::Application が継承された時によばれるメソッド。

Rails.app にクラス名が登録される。

### .instance

instanceを取得するためのメソッドで、インスタンスは run_load_hooks! メソッドが一度呼ばれている必要がある。

### .create

インスタンスを生成するメソッドでnewしたあとに run_load_hooks! メソッドをよぶ。

### .initialized?

初期化済みかどうか。initialize! メソッドが呼ばれていると true になる。

### #run_load_hooks!

before_configuration フックをよびだし、コンストラクタに渡された値を設定する。
before_conifguration を先に実行させたいからこのような仕組みになっているっぽい。

### #call

ORIGINAL_FULLPATH と ORIGINAL_SCRIPT_NAME を設定して call する。
言うまでもなくRackアプリケーションのインターフェイス。

### #reload_routes!

routes をよみなおす。

### #key_generator

key_generator へアクセスするためのメソッド。
キャッシング機構があり、secrets.secret_key_base がなければレガシーなジェネレータを返す。

### #message_verifier

メッセージを検証するオブジェクトを返す。
引数に渡した値をキーにして、秘密鍵は自動的に設定される。
generateで暗号化できverifyで復号できる。

### #config_for

config/*.yml をよみこみするユーティリティ。
erbをとおしてから値をよみこみする。

### #env_config

env に値をセットする。

### #rake_tasks

ブロックを渡して、rake task の定義をする

### #initializer

ブロックを渡してイニシャライザを定義する

### #runner

ブロックを渡してランナーのためのコードを追加する。

### #console

プロックを渡してコンソールのためのコードを追加する。

### #generators

ブロックを渡してジェネレータを定義する。

### #isolate_namespace

isolate_namespaceにモジュールを追加できる。

### #add_lib_to_load_path!

RAILS_ROOT/lib ディレクトリを $LOAD_PATH に追加する。

### #require_environment!

config/environment をよみこみする。

### #routes_reloader

RouterReloaderを返すメソッド。キャッシュ機構がある。

### #watchable_args

config.watchable_file と config.watchable_dir に設定内容を返す。
autoload_paths に含まれる部分には :rb というマークがついてる。

### #initialize!

run_initializers をよみだす。二度は呼べない。

### #initializers

initializers をすべて返す。 Bootstrap Raitie Finisher の順番に並んでいる。

### #config

Application::Configuration のインスタンスを返す。
rootディレクトリを探すのに config.ru が利用される。

### #config=

config をさしかえできる。

### #secrets

config/secretsをよみこみする。

### #secrets=

secrets を差し替えできる。

### #to_app

selfを返すだけ。

### #helpers_paths

helpers_pathsを返すだけ。

### #migration_railties

railite を並びかえて self を覗いたものの一覧を返す。
