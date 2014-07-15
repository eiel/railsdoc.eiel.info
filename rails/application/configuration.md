---
title: Rails::Application::Configuration
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/application/configuration.rb)

Rails アプリケーションの設定情報が格納されていて Rails::Engine::Configuration を継承している。

Rails::Application::Configuration
---

### allow_concurrency

並列実行可能かどうか。デフォルトは nil で true であれば、Rack::Lock を読み込みする。

### asset_host

asset をおくホスト名を格納する。

### assets

ActiveSupport::OrderedOptions のインスタンス。

### assets.enabled

有効化どうか。デフォルトでは true

### assets.paths

デフォルトは []

### assets.precompile

プリコンパイルするファイルの一覧な気がする。

### assets.prefix

配置するパスのプレフィックス。デフォルトは /assets

### assets.version

バージョン。デフォルトでは 1.0

### assets.debug

デバッグモードに。デフォルトは false

### assets.compile

コンパイルするかどうか。デフォルトは true

### assets.digest

ダイジェストを作成するかどうか。デフォルトは false

### assets.cache_store

キャッシュストア。デフォルトでは /tmp/cache/assets/#{Rails.env} に設定されている。

### assets.js_compressor

js を圧縮するかどうか。デフォルトは nil

### assets.css_compressor

css を圧縮するかどうか。デフォルトは nil

### assets.logger

assets のロガー。デフォルトは nil

### autoflush_log

デフォルトは true。ログファイルの sync の値になる。

### cache_classes

クラスをキャッシュするかどうか。デフォルトはRAILS_ENVよって違う。
config/environment/#{RAILS_ENV}.rb で設定されている。

### cache_store

キャッシュの保存先。デフォルトは `tmp/cache`

### consider_all_requests_local

ローカルのリクエストとし認識するようになる。
例外がおきた時の処理が変化したりする。

### console

検索してもひっかからない。 rails console に関係してそうな気はする。

### eager_load

eager_load するかどうか。デフォルトは nil

### exceptions_app

アプリの例外がおきたときの例外クラスを指定する。何も指定していない場合は[ActionDispatch::PublicExceptions](/action_dispatch/middleware/public_exceptions) となる。

### file_watcher

ファイルの監視にどのクラスを使うか。デフォルトでは [ActiveSupport::FileUpdateChecker](active_support/file_update_checker)

### filter_parameters

filter するパラメータを指定する。デフォルトでは []

### force_ssl

sslを強制するかどうか。デフォルトでは false

### helpers_paths

helpers をおくパスを指定。デフォルトでは []

### logger

logger を指定する。デフォルトでは nil

### log_formatter

log のフォーマッタを指定する。デフォルトでは [ActiveSupport::Logger::SimpleFormatter](/active_support/logger/simple_formatter).new が指定される。

### log_tags

[Rails::Rack::Logger](/rails/rack/logger) ミドルウェアの引数となる。デフォルトは nil

### railties_order

Railtie の順番を制御できるっぽい。

### relative_url_root

RAILSアプリケーションのルートを設定できる。デフォルト値は ENV["RAILS_RELATIVE_URL_ROOT"]

### secret_key_base

いわゆる秘密鍵。

### secret_token

わゆる秘密トークン

### serve_static_assets

asset を静的ファイルトとして提供するかどうか。

### ssl_options

ActionDispatch::SSL の引数になる。デフォルト値は `{}`

### static_cache_control

静的ファイルのキャッシュコントロールヘッダを設定できる。

### session_options

セッションストアへのオプションが設定できる。
session_store メソッドの第二引数が代入される。


### time_zone

デフォルトをUTC

### reload_classes_only_on_change

on_cheange したときにリロードするかどうか。デフォルトは true

### beginning_of_week

週の始めはいつか。

### filter_redirect

リダイレクトした際にフィルタするものを登録する。

### log_level

ログレベルを設定する。プロダクション環境であれば info になる。
そうでない場合は debug

### encoding

デフォルトは `utf-8`

### database_configuration

config/database.yml を読み込みで返す部分。

### colorize_logging

ログをカラフルにするかどうか。

### session_store

セッションストアを設定したり、取り出したり。

引数を設定すると設定するモードになる。
