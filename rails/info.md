---
title: Rails::Info
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc1/railties/lib/rails/info.rb)

Railsに関する情報がとれる。

```
$ irb -r rails/all
> Rails::Info.properties
=> [["Rails version", "4.2.0.rc1"],
 ["Ruby version", "2.1.4-p265 (x86_64-darwin14.0)"],
 ["RubyGems version", "2.2.2"],
 ["Rack version", "1.5"],
 ["Environment", "development"]]
```

```
$ ruby -r rails/all -e "puts Rails::Info.to_s"
> puts Rails::Info.to_s
About your application's environment
Rails version      4.2.0.rc1
Ruby version       2.1.4-p265 (x86_64-darwin14.0)
RubyGems version   2.2.2
Rack version       1.5
Environment        development
```


html出力する機能もある

```
$ ruby -r rails/all -e "puts Rails::Info.to_html"
<table><tr><td class="name">Rails version</td><td class="value">4.2.0.rc1</td></tr><tr><td class="name">Ruby version</td><td class="value">2.1.4-p265 (x86_64-darwin14.0)</td></tr><tr><td class="name">RubyGems version</td><td class="value">2.2.2</td></tr><tr><td class="name">Rack version</td><td class="value">1.5</td></tr><tr><td class="name">Environment</td><td class="value">development</td></tr></table>
```
