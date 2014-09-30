---
title: JS::Generators::AssetsGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/js/assets/assets_generator.rb)

`rails g js:assets`の中身。

`app/assots/javascripts/[:class_path]/[filname].js` を生成する。
クラスパスは名前空間。コントローラに対応した空のjavascriptファイル
