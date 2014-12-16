---
title: Rails::RubyVersionCheck
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc3
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc3/railties/lib/rails/welcome_controller.rb)

root_path にわりあてられているコントローラ。
railsについての説明が表示される。
