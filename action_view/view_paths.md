---
title: ActionView::ViewPaths
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/view_paths.rb)

ActionView::ViewPaths
--------------------------------------------------------------------------------

コントローラにミックスインして使うモジュール。
Viewファイルのツリーがどこにあるかを管理する。

コントローラの情報を利用して、ある程度情報を自動で設定する。
[LookupContext](/action_view/lookup_context) のラッパーとも言えそう。

### .parent_prefixes

コントローラの親クラスを辿り、prefixを生成する。
コントローラの継承関係はそれ自体が意味を持ちそう。

### #_prefixes

`.parent_prefixes` の情報に自分自身の情報を含めた prefix を生成する。

### #lookup_context

このクラスで管理している情報を元に [ActionView::LookupContext](/action_view/lookup_context) を生成する。

### #details_for_lookup

空のHashを生成してるだけ… LookupContext をコンストラクタに渡す。
デフォルト値があった時代があるんだろうか。


### #append_view_path

LookupContext に view_path を追加できる。


### #prepend_view_path

LookupContext から view_path を取り除く。
