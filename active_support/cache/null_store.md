---
title: ActiveSupport::Cache::NullStore
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

いくら write して、read しても必ず`nil`を返します。
意味のないように思いますが、キャッシュを外したり、通知は発生するので通知を利用している場合には使い道がありそうです。

```ruby
require 'active_support/cache'
require 'active_support/cache/null_store'

require 'active_support/notifications'

ActiveSupport::Notifications.subscribe('cache_write.active_support') do
  p 'hogehoge'
end

ActiveSupport::Cache::Store.instrument = true
store = ActiveSupport::Cache::NullStore.new
store.write('hoge','hoge')

# > 'hogehogehoge'
```
