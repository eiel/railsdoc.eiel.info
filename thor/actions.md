---
title: Thor::Actions
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/actions.rb)

RailsTemplate などで使えるアクションが定義されている

* [Thor::Actions::EmptyDirectory](/thor/actions/empty_directory)
* [Thor::Actions::CreateDirectory](/thor/actions/create_directory)
* [Thor::Actions::CreateLink](/thor/actions/create_link)
* [Thor::Actions::Directory](/thor/actions/directory)
* [Thor::Actions::InjectIntoFile](/thor/actions/inject_into_file)

Thor::Actions
---

destination_root オプションでファイルの生成先のルートを変更できる。

### .source_paths

コピーするファイルが置かれたpathの一覧を保存しておく

### .source_root

コピーするファイルのおかれたルートディレクタリを保存しておく

### .source_paths_for_search

1. source_paths
1. source_root
1. 親クラスの source_paths

の順でリストをつくり返す。

### .add_runtime_options!

optionの設定。force,pretend,quiet,skipの4種が追加される。


### #action

* action(instance)

instance の invoke! メソッドを呼ぶ。behavior が :revoke なら revoke! メソッドがよばれる。

### #destination_root

destination_root の保存先。
スタックを積めるようになっている。

スタックは`inside` メソッドで一時的にルートを切り替える際などに利用される。

### #destination_root=

destination_root を変更する。

### #relative_to_original_destination_root

* relative_to_original_destination_root(path, remove_dot = true)

引数 path を destination_root からの相対pathに変更する。

### #source_paths

`.source_paths_for_search` をつかって source_paths を取得する。
クラスによって場所が変えられる

### #find_in_source_paths

* find_in_source_paths(file)

file を source_paths から探す。file に `.tt` がついたものも該当する。

### #inside

* inside(dir = "", config = {}, &block)

block を処理している間は dir を destination_root にすることができる。

### #in_root

blockを処理している間は オリジナルの root を destination_root にできる。
inside の中で root に戻りたいときに。

### #apply

外部rubyファイルを実行する。
url も指定可能。urlの場合は accept ヘッダにに "application/x-thor-template"" が設定される。

### #run

* run(command, config = {})

システムコマンドを実行する。

with オプションをつけるとコマンドの前に文字列を追加できる。
一時的な環境変数の設定などに使える。

### #run_ruby_script

* run_ruby_script(command, config = {})

command を ruby コマンドで実行する。
rubyは現在利用しているバイナリをみつけて実行してくれる。

### #thor

thor を実行する。内部で run メソッドを使用する。
