---
layout: post
title: X61安装Gutsy后声卡问题的解决方法 转载自:zhangtao.info
tags:
- gutsy
- Thinkpad
- ubuntu
status: publish
type: post
published: true
meta:
  views: '742'
  _wp_old_slug: x61%e5%ae%89%e8%a3%85gutsy%e5%90%8e%e5%a3%b0%e5%8d%a1%e9%97%ae%e9%a2%98%e7%9a%84%e8%a7%a3%e5%86%b3%e6%96%b9%e6%b3%95-%e8%bd%ac%e8%bd%bd%e8%87%aazhangtaoinfo
---
&lt;!--[CDATA[
 

<h2><a href="http://zhangtao.info/ubuntu/sound-working-in-gutsy-on-x61.pala" title="X61安装Gutsy后声卡问题的解决方法" rel="bookmark">X61安装Gutsy后声卡问题的解决方法</a></h2>
1. sudo apt-get install <em>module-assistant</em>2. 下载<a href="http://zhangtao.info/wordpress/wp-content/uploads/2007/10/x61-build-alsa-module.sh">这个脚本</a>，添加运行权限。运行。
3. sudo dpkg -i 上述脚本所产生的.deb文件

4. X61的音量控制默认为麦克风而不是扬声器，修改方法：打开System&gt;Preferences&gt;Sound， 选中Default mixer tracks下面的PCM。

5. 重启。
