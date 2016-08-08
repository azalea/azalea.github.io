---
layout: post
title: 开启IDLE的自动补全功能
tags:
- IDLE
- programming
- python
status: publish
type: post
published: true
meta:
  views: '528'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
  _searchme: '1'
---
在<a href="http://www.douban.com/group/topic/8317063/" target="_blank">豆瓣Python小组</a>看到的，我以前都不知道IDLE有自动补全功能 =.=

首先，<strong>找到idlelib文件夹的路径:</strong>

Windows: Python安装目录下的AppLibidlelib 目录

Ubuntu: /usr/lib/pythonx.x/idlelib  (比如python2.6)

然后，(以下是复制粘贴，稍有改动)

<strong>打开目录下的config-extensions.def文件 </strong>

[AutoComplete]
enable=1
popupwait=2000
[AutoComplete_cfgBindings]
force-open-completions=&lt;Control-Key-space&gt;
[AutoComplete_bindings]
autocomplete=&lt;Key-Tab&gt;
try-open-completions=&lt;KeyRelease-period&gt; &lt;KeyRelease-slash&gt; &lt;KeyRelease-backslash&gt;

将 enable 设为1 (好像默认值就是1 ---azalea注)
popupwait=2000 这个是弹出自动完成窗口的响应时间
根据自己的喜好设置

然后的然后，<strong>导入需要响应自动补全的模块</strong>

打开目录下的 AutoComplete.py

"""AutoComplete.py - An IDLE extension for automatically completing names.

This extension can complete either attribute names of file names. It can pop
a window with all available names, for the user to select from.
"""

import os
import sys
import string
import wx

在文件的开头导入需要自动完成功能的模块 ，比如我需要使用wx库，所以我在最后一行import wx

其他的库做法类似，保存，重新启动idle就可以了。

最后，如果你想打开自动补全的下拉菜单，要<strong>按 tab 键</strong>

比如

import os

os.s (此时按tab)

就会出现


![](/images/2010/07/idle_auto_complete_example.png)
