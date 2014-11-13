---
title: task Framework
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/tasks/framework.rake)

* rake rails:update
* rake rails:template
* rake rails:template:copy
* rake rails:update:configs
* rake rails:update:bin

が実装されている。

`rails:update` は `rails:update:confihs` と `rails:update:bin` を呼びだす。
`rails:update:configs`は設定ファイルを生成しなおし上書きしてくれる。
boot.rbも再度生成される。

'rails:template` は 環境変数LOCATIONでtemplateを指定してgeneratorを実行できる。
