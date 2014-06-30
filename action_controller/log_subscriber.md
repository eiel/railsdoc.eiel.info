---
title: ActionController::LogSubscriber
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/actionpack/lib/action_controller/log_subscriber.rb)

下記の通知をつかってログ情報をだす部分

* start_processing.action_controller
* process_action.action_controller
* halted_callback.action_controller
* send_file.action_controller
* redirect_to.action_controller
* send_data.action_controller
* unpermitted_parameters.action_controller
* deep_munge.action_controller
* write_fragment.action_controller
* read_fragment.action_controller
* exist_fragment?.action_controller
* expire_fragment.action_controller
* expire_page.action_controller
* write_page.action_controller

`ctionController::LogSubscriber.attach_to :action_controller` でアタッチして対応する通知に対しメソッドに反応する。
