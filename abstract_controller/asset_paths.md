---
title: AbstractController::AssetPaths
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionpack/lib/abstract_controller/asset_paths.rb)

コントローラに AssetPipeline と連携するための仕組みを導入する。
設定情報を保存する領域を作成するだけ。

* asset_host
* assets_dir
* javascripts_dir
* stylesheets_dir
* default_asset_host_protocol
* relative_url_root

だいたい想像がつく。そういえば image はない。
