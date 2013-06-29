---
layout: post
title: Wordpress与MSN Live Space同步插件
tags:
- internet
- plugin
- wordpress
- 插件
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1439'
  _wp_old_slug: wordpres-plugins-live-space-sync
---
叫做<a href="http://privism.org/blog/live-sync" target="_blank">Live Space Sync</a>,

<a href="http://priv.dreamhosters.com/livesync/wp-livesync101.zip" target="_blank">下载最新版</a>（目前是1.01，支持Wordpress2.5），把php文件上传到wp-content/plugins目录，在后台Plugins激活。

然后到MSN Live Space（如果你有的话，没有的注册一个)-&gt;options-&gt;E-mail publishing, 选中"Turn on e-mail publishing"，填好email和密码（这个密码专门用来email发布，不一定是邮箱的密码），其他选项不用care，一会可以用这个插件设置

现在到Wordpress后台的Options(或Write)-&gt;Live Sync设置。在Space Name填入空间名称(若Live Spaces网址是azaleammm.spaces.live.com，就填入azaleammm)，在Password中填入刚才设定的密码，Post Status设定同步至Live Space的文章是发表还是草稿，Sync Delete是设定在wordpress删除文章时，要不要同步删除Live Space上面的对应文章。

设定好以后点Update Options，就搞定了。下面可以设置输出的格式，具体懒得抄了，大家可以看作者的<a href="http://priv.tw/blog/msn-sync-modified" target="_blank">中文版说明</a>或<a href="http://privism.org/blog/live-sync" target="_blank">英文版说明</a>。都搞定后在Options-&gt;Live Sync最下面点Sync all existing posts,可以把之前的所有文章同步到Live Space.以后新发表的文章会自动同步的。
