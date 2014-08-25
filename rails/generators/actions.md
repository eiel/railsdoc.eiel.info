---
title: Rails::Generator::Actions
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/actions.rb)

[Thorのもつ action に付け加えて](/thor/actions) Generator 固有の action が定義されています。

Rails::Generator::Actions
---

### #gem

Gemfile に gem の記述をする。

### #gem_group

Gemfile に group の記述をする。
ブロック内の記述はブロック内に挿入される。

### #add_source

Gemfile の先頭に source の記述を追加する。

### #environment

config/application.rb や config/environments/#{env}.rb に追記する。

:env オプションで環境を指定できる。

### #git

git コマンドを実行する。

`git :init` で git init が実行できる。引数がある場合は `git add: 'hoge'` のように Hash で指定する。


### #vendor

veder ディレクトリにファイルを追加する。第2引数またはブロックの戻り値が利用されます。

### #lib

lib ファイルにファイルを追加する。

### #rakefile

`lib/tasks` にファイルを追加する。
rake がよみこみするディレクトリなので、タスクを追加できる。

### #initializer

`config/initializers` にファイルを追加する。


### #generate

rails generator を実行する。

### #rake

rake コマンドを実行する。

### #capify!

capify . を実行する。

### #route

rake/routes にルーティング追記する。

### #readme

readme ファイルをよみこみして中身を画面に表示します。

### #after_bundle

busdle 実行後に行う処理を追加できます。

### #log

画面に出力します。
引数が複数の場合は say_status 使われます。

### #extify

windowsであれば .bat を追加します。

### #quote

引数をクオートします。
コマンドに渡す場合に利用したりする。
