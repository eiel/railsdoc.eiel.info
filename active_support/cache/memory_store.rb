---
title: ActiveSupport::Cache::MemCachStore
---

試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

キャッシュ機能を提供し保存方法を決定する [ActiveSupport::Cach::Store](/active_support/cache) の具象クラスのひとつです。

保存先にはメモリになります。
複数のプロセスを起動して rails を運用している場合、プロセス間でキャッシュは共有できません。

キャッシュはデフォルトで 32MB まで使用できます。
コンストラクタに `:size` オプションを指定することで値を変更できます。
