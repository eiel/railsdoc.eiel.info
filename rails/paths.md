---
title: Rails::Paths
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/paths.rb)

Rails::Paths::Root と Rails::Paths::Path が定義されている。
Rails.application.config.paths の返すオブジェクトが Rails::Paths::Root のインスタンスになる。
Root がもつオブジェクトが Rails::Paths::Path のインスタンスになる。

Rails::Paths::Root
---

ルートディレクトリの位置をコンストラクタで受け取りする。
Rails::Engine でも仕様するためだと思われる。

add メソッドでパスの追加をすることができる。
追加したパス [] メソッドを経由してアクセスする。


Rails::Paths::Path
---

パスではあるけどリストになっている。
コンストラクタでは Rails::Paths::Root への参照と current と path を option をうけとる。
path の下層のファイルは複数あるのリストになってるんじゃないかと思われる。
また、controller を保存してるディレクトリが複数あったりもするからだろう。


* autoload_once
* eager_load
* autoload
* load_path

するかどうかを option で指定できる。
