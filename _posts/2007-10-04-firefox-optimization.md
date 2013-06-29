---
layout: post
title: 我的FIREFOX安装全过程-转载
tags:
- firefox
- internet
status: publish
type: post
published: true
meta:
  views: '782'
  _wp_old_slug: '%e6%88%91%e7%9a%84firefox%e5%ae%89%e8%a3%85%e5%85%a8%e8%bf%87%e7%a8%8b-%e8%bd%ac%e8%bd%bd'
---
转载自<a href="http://my.opera.com/hanwei.v/blog/show.dml/389966" target="_blank">这里</a></p>
网络提速
下面的设置看起来是通用的，只是做了两个补充- 插件的路径可以在about: plugins 中找到，关掉了书签菜单延迟。
user_pref("network.http.pipelining", true);
user_pref(" network.http.proxy.pipelining", true);
user_pref("network.http.pipelining.maxrequests", 8);
user_pref("content.notify.backoffcount", 5);
user_pref("plugin.expose_full_path", true);
user_pref("ui.submenuDelay", 0);

Firefox 缓存 ：
默认状态下 Firefox 的缓存大小不是固定不变的，设置缓存占用的大小可以降低内存消耗
，具体操作如下：
about:config:
browser.cache.memory.capacity
在这里根据自己的情况设置缓存大小。

您也可以通过将 browser.cache.memory.enable 设置为 false 来完全禁用缓存使用。不过除非您的内存实在不够用，不建议使用这项功能，因为这样做会非常明显的降低 FF 的性能。

最小化之后的内存释放：
通过如下设置可以在您所有的 FF 窗口最小化以后重新释放内存，注意：只在 windows 下有效。
about:config:
config.trim_on_minimize 赋值 ture

快进快退：
Firefox 1.5 为了加速见面浏览速度增加了浏览页面时快进快退的功能，当然这也增加了内存的负荷，您可以通过如下操作来禁用此功能：
about:config:
browser.sessionhistory.max_total_viewers 赋值 0
如果您不想禁用该功能的话也可以参照以下链接的说明，对 browser.sessionhistory.max_total_viewers 键值进行相关操作来优化设置，这里介绍的已经很详细了，我有空再翻吧： <a href="http://kb.mozillazine.org/Browser.sessionh...mended_settings" target="_blank">http://kb.mozillazine.org/Browser.sessionh...mended_settings</a>

一、启动提速新招

在浏览器地址栏中输入"about:config"，回车确认操作，而后在"过滤器"中输入 "network.dns.disableIPv6"，再点击"全部显示"按钮。此后，用鼠标双击"network.dns.disableIPv6"首 选项，将默认值由"false"修改为"true"。最后，重新启动程序，使设置生效。

二、定制默认简体中文搜索引擎

如果你在用Firefox执行搜索操作时发现搜索引擎并非直接查找简体中文网页，则可自行定制。同样，打开"about:config"，在"过滤器" 中输入"browser.search.defaulturl"，修改该项目的值为"http: //www.google.com/search?q="

六、配置文件大挪移

Firefox的配置文件中包括程序选 项设置、书签及扩展、插件等信息，而其默认是存储于系统盘中（不论程序是否安装于系统盘）。为了使重装系统时无需麻烦地备份配置文件，还是先更改其路径为 非系统盘为佳。我们先创建一个Firefox程序的快捷方式，再用鼠标右键单击，在弹出菜单中选择"属性"，而后查看弹出窗口的"快捷方式"标签页，在" 目标"选项中添加参数"-p"。确认操作后，双击该快捷方式启动 Firefox，会弹出"Firefox-选择用户配置文件"对话框。在此点击"创建配置文件"按钮，然后按照向导的提示为配置文件命名并选择存储路径。

问：如何增加鼠标卷动的行数？

答：打开firefox，在地址栏输入about:config，将
mousewheel.withnokey.sysnumlines 设为false
mousewheel.withnokey.numlines 设定了滚动的行数，推荐设置为７

问：如何删除about:config里自定义的选项？

答：在地址栏输入about:config，接着在鼠标右键菜单中选择"重置"，之后重启Firefox。
另一种办法是，打开配置文件中的 prefs.js，删除相关的设置（不推荐）

问：如何打开配置文件管理器（如何创建多个配置文件）？

答：在Firefox的启动路径后加上参数"-p"（不带引号）或是"-profilemanager"（不带引号）即可。如 firefox -p，firefox -profilemanager。

如果是 Windows 系统，也可从开始菜单中选择"开始--&gt;;
<ul>
	<li> 运行"</li>
</ul>
输入 firefox -p
如果不行，请输入 Firefox 的完整路径，然后加上参数"-p"（不带引号），如：
"C：Program FilesMozillaFirefoxMozillaFirefox.exe" -p
打开配置文件管理器，您就可以增加、删除、重命名原来的配置文件了。另外请一定注意'-p'前有空格。
其中的'C:Program FilesMozilla Firefox'是指的Firefox.exe文件的具体路径，请根据自己情况调整。
Linux下则先切换到 Firefox 目录下，然后运行 ./firefox -p 或 ./firefox -profilemanager 来启动Firefox，并创建配置文件。
如：cd /usr/lib/firefox
./firefox -profilemanager

注意：①打开配置文件管理器前，必须关闭Firefox的所有进程。WINDOWS中在任务管理器中查看和关闭Firefox；Linux下则用ps和kill命令查看和关闭Firefox。
②给Firefox建立新的配置文件时应该建一个新文件夹，少数朋友可能会图方便而利用一个已有的文件夹，比如放到桌面上，强烈建议您不要这样做。这是由 于Firefox在删除其配置文件时，会删除该文件夹内的所有文档，若把配置文件夹放到桌面上，那么在删除这个配置文件后，你就会发现，除了我的电脑、我 的文档、回收站之外，其余东西都没了。因此请一定注意不要省略"新建文件夹"这一步。

问：如何自定义 Firefox 的临时文件存放地址？

答：打开firefox，地址栏输入about:config
右键新建一个字符串，名为browser.cache.disk.parent_directory
然后输入新的临时文件的路径即可。比如 D:Temporary Internet Files

在地址栏输入
about:config
进入设置页面，在过滤器一栏输入
google
将找到的两个项目：
browser.search.param.Google.1.custom
browser.search.param.Google.1.default
将其键值清空即可

问：怎样将默认的内置搜索引擎由google改为百度？

答：在网页中高亮选中文字，再用鼠标拖动一下选中的文字
，直接搜索的方法，非常方便。但firefox默认的搜索引擎是google，将其改为百度的方法是：
在地址栏输入about:config，进入设置页面，找到browser.search.defaulturl，将其键值改为
<a href="http://www.baidu.com/s?ie=UTF-8&amp;wd=" target="_blank">http://www.baidu.com/s?ie=UTF-8&amp;wd=</a>

问：如何让打开的新标签和书签在后台载入？

答：在地址栏输入about:config，分别找到下面两项：
browser.tabs.loadDivertedInBackground （标签）
browser.tabs.loadBookmarksInBackground （书签）
将其赋值为 True。

问：如何关闭用Firefox下载完软件后右下角弹出的完成提示？

答：在地址栏输入 about:config，找到
"browser.download.manager.showalertOnComplete"并将其设置为 false 。

<a href="http://google.com/search?btnG=Google+Search&amp;q=" target="_blank">http://google.com/search?btnG=Google+Search&amp;q=</a>
<a href="http://www.google.com/search?q=" target="_blank">http://www.google.com/search?q=</a>

在快捷方式右击，加空格加-turbo可以加快FF启动

问：Firefox 自动升级后，或扩展更新后，Firefox 的界面由中文变成了英文，如何改回来？

答：请在 Firefox 的地址栏输入
about:config
找到并双击
general.useragent.locale
将 en-US 改为 zh-CN 。
