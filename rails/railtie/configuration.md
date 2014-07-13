---
title: Rails::Railtie::Configuration
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/railtie/configuration.rb)

Rails::Engine::Configuration や Rails::Application::Configuration に継承されて使われる。
Raitie の設定項目のデフォルト値ともいえる。

Rails::Railtie::Configuration
---

設定値はクラス変数に保存される。

以下の処理順を意識しておくとよい

1. require "config/boot.rb" する。ロードパスの設定
1. Railtie や Rails::Engine を読み込みする
3. Rails::Application を作成する
4. before_configuration を呼ぶ
5. Load config/environments/ENV.rb
6. config.before_initialize を呼ぶ
7. railite や engine、application のRailtie#initializer を呼ぶ
8. middleware を構築して to_prepare を呼ぶ
9. eager_load するのであれば before_eager_load して eager_load! する。
10. after_initialize を呼ぶ

### eager_load_namespaces

eager_load するネームスペース

### watchable_files

監視するファイルの一覧

### watchable_dirs

監視するディレクトリの一覧

### app_middleware

middleware を登録する方法を記録する。
詳細は [Rails::Configuration::MiddlewareStackProxy](/rails/configuration) など。

### app_generators

generataor を登録する。ブロックをわたす。
詳細は [Rails::Configuration::Generators](/rails/configuration) など。


### before_configuration

configuration の前の処理を登録できる

### before_eager_load

eager_load の前に処理を追加できる

### before_initialize

初期化前に処理を追加できる。

### after_initialize

初期化処理後に処理を追加できる。

### to_prepare_blocks

after_initialize の前の処理を一覧を返す

### to_preprae

after_initialize に前の処理を登録する。

### method_missing

optionにもつ場合は値を返し、代入系メソッドであればoptionに値を保存する。
