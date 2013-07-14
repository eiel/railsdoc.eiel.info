---
title: Core Ext Marshal
---
ActiveSupport 拡張で追加される Marshal のメソッド
================================================================================


試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/core_ext/marshal.rb)

### .load_with_autoloading

* load_with_autoloading(source)

`load` メソッドに 永続化したファイルをロードする際にオートロードを試みる機能を追加するようです。
読み込みに失敗した定数に直接アクセスすることで Autoload を実行するような実装になっていました。

非常に興味深い実装なのですが、これで上手くいく理由までは検証できてません。
