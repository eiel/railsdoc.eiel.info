---
title: ActiveRecord::Associations::Builder::BelongsTo
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activerecord/lib/active_record/associations/builder/belongs_to.rb)

ActiveRecord::Associations::Builder::SingularAssociationを継承しているつながりを提供するbelongs_toメソッドのActiveRecord::Reflectionを作成するビルダー。


使えるoptionsは以下が追加される。

* :foreign_type
* :polymorphic
* :touch
* :counter_cache


counter_cache と touch にコールバックを追加される。

couter_cacheを有効にするとupdate時に`belongs_to_counter_cache_after_update`が呼ばれる。

toucheのほうはzave, touch destroy後に呼ばれる。
touchを読んで変更日時を更新してくれる。
