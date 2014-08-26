---
title: Rails::Generators::AppBase
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/base.rb)

rails new した時の Generator の基礎になる。

実際には [AppGenerator](/rails/generators/app_generator) がいる。
各種オプションの設定が行なわれている。

protected なメソッドがほとんどで、継承先で使われると考えられる。

Rails::Generators::AppBase
---

### gemfile_entry

* gemfile_entry(name, *args)

引数name gem をGemfileに追加できる。
第2引数は version。 github と path オプションも使える。

@extra_entries に情報が蓄積される。


### #gemfile_entries

追加する gem の一覧を返す。

--skip_gems オプションで指定されたものはここの一覧からフィルターされる。

### #add_gem_entry_filter

@gem_filter に filter を追加できる。
ブロックで処理を渡す。

### #builder

builder を構築して返す。
例としては[Rails::Generators::AppBuilder](/rails/generators/app_base)主に、ファイル生成を担う。
[Rails::Generators::ActionsMethods](ActionMethods)をついでに include してくれる。

### #build

builder に命令を送る。

### #create_root

ルートディレクトリを作成して、そこにチェンジディレクトリする。

### #apply_rails_template

オプションtemplateの指定があった場合に template を利用する。

### #setset_default_accessors

destination_root と  rails_template の設定をする。

template オプションの中身は httpではじまるものであればそのまま、文字列だったら現在のディレクトリパスを追加する。

### #database_gemfile_entry

利用するDBに応じて gem を設定する。

### #include_all_railties?

すべての rails  デフォルトの機能が読み込みするか確認できる。

### #comment_if

value の値がなければ '# ' を返す。

### #sqlite3?

sqliet3 を使うか確認する

### #rails_gemfile_entry

rails を Gemfile に追加する。

dev の場合は 次バージョンのブランチを追う。
edge の場合は 元バージョンのブランチを追う。


### #gem_for_database

利用するデータベースにあった gem を返す。

### #convert_database_option_for_jruby

jruby の場合の database の値を書き換えます。

### #assets_gemfile_entry

asset 関連の gem を設定します。

* sprockets-rails
* sass-rails
* uglifier

を追加します。

### #jbuilder_gemfile_entry

jbuilder を使用する場合のgemを追加します。

### #sdoc_gemfile_entry

sdoc を使用する場合のgemを追加します。 doc/api を生成します。

### #coffee_gemfile_entry

coffee script を使用する場合のgemを追加します。

coffee-rails が設定されます。

### #javascript_gemfile_entry

デフォルトでは jquery が指定され jquery-rails が設定される。

自動的に turbolinsと coffeescript と javascript_runtime が呼ばれる。

### #javascript_runtime_gemfile_entry

thurubyracer のコメントアウトされた状態で追加される。

### #spring_gemfile_entry

spring を使用する場合は spring が Gemfile に追加される

### #bundle_command

bundle コマンドを実行するためのアクション

第1引数の値がサブコマンドになる

### #bundle_install?

bundle install をするかどうかを返す

### #spring_install?

spring を install するかどうかを返す

### #run_bundle

bundle_installを実行する。実行する必要がない場合は実行しない。

### #generate_spring_binstubs

bundle exec binstub --all を実行する。
実行する必要がない場合に実行すると何もしない。

### #empty_directory_with_keep_file

空のディレクトを作成して、.keepを作成するアクション

### #keep_file

.keep を作成するアクション

Rails::Generators::GemfileEntry
---

構造体

メンバ

* :name
* :version
* :comment
* :options
* :commented_out


### .github

github から取得する場合のファクトリ

### .version

version を指定する場合のファクトリ

### .path

path を指定する場合のファクトリ

### #padding

* padding(max_width)

引数 max_width に併せて空白をつくってくれる。
