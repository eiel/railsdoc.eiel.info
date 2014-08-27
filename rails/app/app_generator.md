---
title: Rails::AppGenerators
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/generators/rails/app/app_generator.rb)

rails new したときのGenerator がこの Rails::AppGenerator

Rails::ActionMethods
---

generator にアクションを委譲するモジュール。
委譲先はコンストラクタで渡す。

Rails::AppBuilder
---

generator から build(:コマンド名) で呼び出せるアクションが定義されていて、基本的なファイルの生成部分が主に定義されている。

Rails::Generators::AppGenerator
---

Rails::Generators::AppBase を継承している。

Rails new した時に呼び出される generator。

ほとんど build で実装されている。環境に応じて mysql の sock が変わるようになってたりする工夫もある。
