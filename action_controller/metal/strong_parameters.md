---
title: ActionController::StrongParametres
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2.rc2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc2/actionpack/lib/action_controller/metal/strong_parameters.rb)

Rails4 から追加された機能で、ユーザからのリクエストパラメータをフィルタリングのような機能を追加します。

params メソッドをオーバライドしていて、返すオブジェクトを ActionController::Parameters のインスタンスにすることで実現している。

ActionController::ParameterMissing
--------------------------------------------------------------------------------

パラメータに要求されたキーが存在しなかったり、中身が空の場合に発生する例外。

ActionController::UnpermittedParameters
--------------------------------------------------------------------------------

利用の許可されていないパラメータがある場合に発生する例外です。

 `ActionController::Base.action_on_unpermitted_parameters` を :raise に設定していると発生する。


ActionController::Parameters
--------------------------------------------------------------------------------

params の情報を管理するクラス。

`require` メソッドで指定した key が存在することが確認でき、その値を取り出しします。
`permit` メソッドでどのパラメータを利用するのかを指定します。

`permit_all_parameters` にキーを指定しておくと、permitでの指定を省略できます。

ActionController::StrongParameters
--------------------------------------------------------------------------------

params を ActionController::Parameters のインスタンスに差し替えるようにする部分です。
