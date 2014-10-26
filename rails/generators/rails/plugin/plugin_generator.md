---
title: Rails::Generators::PluginGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta2/railties/lib/rails/generators/rails/plugin/plugin_generator.rb)

`rails plugin new`の中身。
[AppGenerator](/rails/generators/rails/app/app_generator) と同じような構成になっている。

PluginBuilderとPluginGeneratorで構成されている。
[AppBase](/rails/generators/app_base)を継承している。

著者の名前やメアドはgitの設定から読み込みするようになっている。
fullオプションとmauntableオプションがあり3種類のプラグインの種類が作成できる。
両方指定した場合はfullオプションが優先される。
