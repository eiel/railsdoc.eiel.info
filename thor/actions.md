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

### #action

* action(instance)

instance の invoke! メソッドを呼ぶ。behavior が :revoke なら revoke! メソッドがよばれる。

### #destination_root

### #destination_root=

### #relative_to_original_destination_root

### #source_paths

`.source_paths_for_search` をつかって source_paths を取得する。
クラスによって場所が変えられる

### #find_in_source_paths

* find_in_source_paths(file)

file を source_paths から探す。file に `.tt` がついたものも該当する。

### #inside

### #in_root

### #apply

### #run

### #run_ruby_script

### #thor
