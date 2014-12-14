---
title: Rails::MailersController
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc3
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc1/railties/lib/rails/railtie.rb)

すべてのRailtie基底クラス。

[Rails::Initializable](/rails/initializable)がインクルードされている。


### .subclasses

Railtieのサブクラスの一覧を保持する。

### .rake_tasks

rakeのための処理を記録する。

### .console


rails c のための処理を記録する。

### .runner

rails runner のための処理を記録する。

### .generators

rails g のための処理を気楽する。

### .abstract_railtie?

Rails::Railite, Rails::Engine, Rails::Application の場合trueを返す。
そのまま使うなということらしい。

### .railtie_name

名前を返す。引数を渡すと設定もできる。

### .instance

インスタンスを生成する。newがprivateのため、ここからつくる。シングルトン。

### .respond_to_missing?

処理できない場合はインスタンスへデリゲートする。

### .configure

インスタンスのconfigureへのアクセッサ。

### #railtie_name

クラス名を返します。

### #initialize

Rails::Railite, Rails::Engine, Rails::Application のインスタンスを作ろうとすると例外を返す。

### #configure

ブロックをわたすとinstance_eval されます。

### #config

Railtie::Configuration のインスタンスを返す。

### #railtie_namespace

親クラスをたどってrailite_namespaceを返す。
