---
title: ActionController::DataStreaming
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.1
```
* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionpack/lib/action_controller/metal/data_streaming.rb)

コントローラに `#send_file` メソッドや `#send_data` メソッドを追加する。
この時に、ブラウザにはストリーミングでファイルを送信する。

ActionController::DataStreaming
----

### #send_file

* send_file(path, options = {})

path で指定したファイルを送信する。
この時16384バイトずつ読んで送信するようになっている。

### #send_data

* send_data(data, options = {})

data を送信する。特にストリーミングとかしないように見える。
