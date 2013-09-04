---
layout: post
title: Ubuntu9.04安装ibus输入法
tags:
- ubuntu
- 输入法
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '2805'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
---
看到<a href="http://linuxtoy.org/archives/ibus.html" target="_blank">很多人推荐</a> <a href="http://code.google.com/p/ibus/" target="_blank">ibus</a>，于是决定在刚装好的Ubuntu9.04里试一下：

1. 在/etc/apt/sources.list文件里添加源：
deb http://ppa.launchpad.net/ibus-dev/ppa/ubuntu jaunty main

2. sudo apt-get update

3. sudo apt-get install ibus ibus-pinyin

如果需要五笔输入法，则加上 ibus-table ibus-table-wubi

4. im-switch -s ibus

5. 重新登录

6. Panel上应该出现ibus图标，右键Preferences-&gt;Input Methods -&gt; Select an input method -&gt; Add

7. Ctrl+Space激活

如果能启动ibus，但不能激活输入法：
编辑/usr/lib/gtk-2.0/2.10.0/immodule-files.d/libgtk2.0-0.immodules
在文件最后添加两行：
"/usr/lib/gtk-2.0/2.10.0/immodules/im-ibus.so"
"ibus" "X Input Method" "gtk20" "/usr/share/locale" "zh"
重新登录

参考：

<a href="http://code.google.com/p/ibus/wiki/Ubuntu" target="_blank">http://code.google.com/p/ibus/wiki/Ubuntu</a>

<a href="http://forum.ubuntu.org.cn/viewtopic.php?p=915368" target="_blank">http://forum.ubuntu.org.cn/viewtopic.php?p=915368</a>