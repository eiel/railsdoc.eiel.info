---
title: ActiveModel::Error
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/errors.rb)

エラーの内容を格納しておくためのクラス。
ActiveRecordのクラスであれば errors でインスタンスにアクセスできる。
そうでない場合は自分でインスタンスを保持しておけばよい。
その場合は、コンストラクタにselfを渡すのが定番。

インスタンス変数@messagesにエラーを格納していく。
アクセスするためのgetメソッドやsetメソッドなどなどが用意されている。

i18n に対応する場合はgenerate_messageが使われるので、うまくメッセージを登録すればよい。
