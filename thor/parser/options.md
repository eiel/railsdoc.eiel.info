---
title: Thor::Options
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/parser/options.rb)

[Thor::Arguments](/thor/parser/arguments/) を継承している。

Thor::Options
---

コマンドの受付するオプションを管理し、parse メソッドで [Thor::CoreExt::HashWithIndifferentAccess](/thor/core_ext/hash_with_indifirent_access) 形式に変換する。

### .to_switches

* to_switches(options)

ハッシュをハイフンをつかった形式のオプションに変更する

```ruby
require 'thor/parser/arguments'
require 'thor/parser/options'

Thor::Options.to_switches(hoge: true, mogu: 'goro', foo: [:bar,:boo], guru: {key: :hoge}) # => "--hoge --mogu \"goro\" --foo :bar :boo --guru key:hoge"
```

### #initialize

* initialize(hash_options = {}, defaults = {}, stop_on_unknown = false)

stop_on_unknown が true の場合、知らないオプションが登場した時点で停止する。
