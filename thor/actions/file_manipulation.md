---
title: Thor::Actions::FileManipulation
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/d634d240bdc0462fe677031e1dc6ed656e54f27e/lib/thor/actions/file_manipulation.rb)

他のアクションをつかって構築されたアクションなどが定義されている。

Thor::Actions
---

ここのメソッドで指定される source 引数は [Thor::Actions#find_in_source_paths](/thor/actions) で指定された sourceから探す。

### #copy_file

* copy_file(source, *args, &block)

引数source をコピーする。コピー先を調整したい場合は第2引数を指定する。

block を指定すると source を中身にして処理したものをコピーできる。

オプションニ mode: :preserve を指定しない場合はファイルパーミッションが変更される恐れがある。

### #link_file

* link_file(source, *args, &block)

引数 block は使用されない。 source へのリンクを作成する。copy_file と同様、作成ファイル名を変更する場合は第2引数を指定する。

[create_link](/thor/actions/create_link)を使用して、link を探す。

### #get

* get(source, *args, &block)

source を取得して配置する。source には URLを指定できる。
引数のブロックは 配置先を決めるのに利用できる。

### #template

* template(source, *args, &block)

ERBで書かれたテンプレートファイルを展開して

### #chmod

* chmod(path, mode, config = {})

引数 path のパーミッションを 引数 mode に設定する。 先頭に0をつけて 0755 のように指定するとよい。

### #prepend_to_file

* prepend_to_file(path, *args, &block)

引数pathの先頭に内容を追加する。内部で [insert_into_file](/thor/actions/injert_into_file)を利用する。

### #append_to_file

* append_to_file(path, *args, &block)

引数path の末尾に内容を追加する。内部で [insert_into_file](/thor/actions/injert_into_file)を利用する。

### #inject_into_class

* inject_into_class(path, klass, *args, &block)

引数 path のファイルに定義されているクラスに追記する。クラスの指定は klass引数を使う。
内部で [insert_into_file](/thor/actions/injert_into_file)を利用する。

### #gsub_file

* gsub_file(path, flag, *args, &block)

引数pathで指定されたファイルの中身の一部を置換する。
flag で置換対象を設定し、ブロックもしくは追加の引数で変換後の内容を指定する。

### #uncomment_lines

* uncomment_lines(path, flag, *args)

引数pathで指定したファイルのflagにマッチする行のコメントを外す。

### #comment_lines

* comment_lines(path, flag, *args)

引数pathで指定したファイルのflagにマッチする行をコメントにする。

### #remove_file

* remove_file(path, config = {})

引数pathで指定したファイルを削除する。
