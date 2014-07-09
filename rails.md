---
title: Rails
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails.rb)

事前にRubyのバージョンチェックが行われる。

Rails
--------------------------------------------------------------------------------

### .application

アプリケーションのインスタンスにアクセスできる。
アプリケーションはシングルトンで複数作成できない。

### .cache


### .logger


### .configuretion

Rails.application.config のショートカット。


### .backtrace_cleaner

バックトレースクリーナーを返す。

HTMLで表示する際のバックトレースをみやすくする。

### .root

アプリケーションのプロジェクトルートを返す。

### .env

RAILS_ENV もしくは RACK_ENV の値を返す。未設定の場合は development になる。

### .env=


RAILS_ENVの値を無視して上書きする。


### .groups

Rails.env の値と RAILS_GROUP の値を カンマでセパレートする。
メソッドの引数に追加したいグループのキーで、RAILS_ENV の値に応じて追加したりできる。

例

```
> Rails.groups
[:default, "development"]
> Rails.groups(hoge: [:development))
[:default, "development", :hoge]
> Rails.groups(hoge: [:test])
[:default, "development"]
```

### .public_path

最初の pbulic_path を返す。
