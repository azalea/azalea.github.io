---
layout: post
title: Thinkpad T43 Windows XP&amp;Ubuntu Gutsy双系统安装全过程
tags:
- Thinkpad
- ubuntu
- windows
status: publish
type: post
published: true
meta:
  views: '786'
  _wp_old_slug: thinkpad-t43-windows-xpubuntu-gutsy%e5%8f%8c%e7%b3%bb%e7%bb%9f%e5%ae%89%e8%a3%85%e5%85%a8%e8%bf%87%e7%a8%8b
---
<a href="http://hi.baidu.com/azaleammm/blog/item/914377a70f308296d143580a.html" target="_blank">书接上回</a>说到帮我同学用linux备份了文件，他就用Thinkpad自带的一键恢复功能重装了Windows XP，但他心中念念不忘linux的倩影，于是昨晚，我开始了5小时漫长的双系统安装之路（其实不用这么久的，2个小时足矣，谁知道意外不断，惊喜也不少）
首先是<strong>分区</strong>，他的电脑本来是不分区的，这也是为啥上次备份搞得这么辛苦。于是下载了PartitionMagic，把硬盘分成IBM_PRELOAD, IBM_SERVICE, E:，和free space。结果Apply的时候提示竟然说:这个PartitionMagic是Demo版的，只能耍人，不能分区。还好发现我电脑里有PartitionMagic的安装文件，这次是货真价实的，于是分区搞定，在E:分区后保留了10G的free space。

然后就开始<strong>安装</strong>Gutsy Beta版，10G的空间分区还真是头痛，最后swap分了509MB，其他的都给了分区。然后哼哧哼哧地装到70%时被告知，你的光盘有问题，重新刻一张吧，刻的速度不要这么快了。我昏。。于是开始装Alpha版，因为我自己装的是Tribe 5，可以保证安装盘没问题。这次不敢用Thinkpad自带的光驱了，慢死，于是用了USB外接光驱，安装很快，半小时左右。

然后开始<strong>升级</strong>。先把源换成官方源，可以修改/etc/apt/sources.list
也可以在System-&gt;Management-&gt;Software Sources里选择Main Source

然后
sudo apt-get update
sudo apt-get dist-upgrade
等了很久，估计有一个多小时，总算升级到6.22-13版本了。

<strong>设置系统中文环境支持：</strong>
先在sources.list添加cn99的源，因为官方源中找不到language-pack-zh
sudo gedit /etc/apt/sources.list

在最前面粘贴下面一堆:
<pre>deb http://ubuntu.cn99.com/ubuntu/ gutsy main restricted universe multiverse</pre>
<pre>deb http://ubuntu.cn99.com/ubuntu/ gutsy-security main restricted universe multiverse</pre>
<pre>deb http://ubuntu.cn99.com/ubuntu/ gutsy-updates main restricted universe multiverse</pre>
<pre>deb http://ubuntu.cn99.com/ubuntu/ gutsy-proposed main restricted universe multiverse</pre>
<pre>deb http://ubuntu.cn99.com/ubuntu/ gutsy-backports main restricted universe multiverse</pre>
<pre>deb-src http://ubuntu.cn99.com/ubuntu/ gutsy main restricted universe multiverse</pre>
<pre>deb-src http://ubuntu.cn99.com/ubuntu/ gutsy-security main restricted universe multiverse</pre>
<pre>deb-src http://ubuntu.cn99.com/ubuntu/ gutsy-updates main restricted universe multiverse</pre>
<pre>deb-src http://ubuntu.cn99.com/ubuntu/ gutsy-proposed main restricted universe multiverse</pre>
<pre>deb-src http://ubuntu.cn99.com/ubuntu/ gutsy-backports main restricted universe multiverse</pre>
<pre>deb http://ubuntu.cn99.com/ubuntu-cn/ gutsy main restricted universe multiverse</pre>
保存，然后

sudo apt-get install language-pack-zh

<strong>字体美化</strong>

先到<a href="http://wenq.org" target="_blank">文泉驿网站</a>下载<a href="http://wenq.org/index.cgi?BitmapSong" target="_blank">文泉驿点阵宋体</a>，
sudo dpkg -i 包名
安装

更改系统字体:System-&gt;Preferences-&gt;Appearance-&gt;Fonts
前4行都改成WenQuanYi Bitmap Song 12
第5行改成Monospace 12
Rendering的Details里，Resolution设为106，Smoothing设为None, Hinting设为Medium

更改Firefox字体:Edit-&gt;Preferences-&gt;Content
Default font:WenQuanYi Bitmap Song  Size:16
Advanced...
第一行 Western
第二行 Serif  16
第三行 WenQuanYi Bitmap Song
第四行 san-serif
第五行 monospace  12
第六行 None

以上不这么设置是完全可以的，看个人喜好啦

<strong>安装输入法</strong>

推荐fcitx输入法，安装:

sudo apt-get install im-switch fcitx
im-switch -s fcitx -z default         #注意！前面不要加sudo

重启X (Ctrl+Alt+Backspace)

fcitx设置(可选)

gedit ~/.fcitx/config

将显示字体修改成自己喜欢的字体
如果想要紫光外观的候选框，可以参考<a href="http://zhangtao.info/ubuntu/fcitx_meihua.pala" target="_blank">这篇文章</a>

如果是英文locale，还需要进行以下设置

sudo gedit /usr/lib/gtk-2.0/2.10.0/immodule-files.d/libgtk2.0-0.immodules

找到以下部分：

<font color="#3366ff">“/usr/lib/gtk-2.0/2.10.0/immodules/im-xim.so”
“xim” “X Input Method” “gtk20″ “/usr/share/locale” “ko:ja:th:zh”
</font>
修改为：

<font color="#3366ff">“/usr/lib/gtk-2.0/2.10.0/immodules/im-xim.so”
“xim” “X Input Method” “gtk20″ “/usr/share/locale” “<font color="#ff0000">en:</font>ko:ja:th:zh”</font>

重启X，搞定，现在Ctrl+Space就可以启动fcitx输入法

<strong>安装多媒体解码器</strong>

sudo apt-get install audacious audacious-plugins audacious-plugins-extra libdvdcss2 libdvdnav4 libdvdplay0 libdvdread3 w32codecs libxine-extracodecs gstreamer0.10-pitfdll gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-ugly gstreamer0.10-plugins-ugly-multiverse

有几个好像安装不了，把那几个去掉再试下就可以了

<strong>安装smplayer</strong>

sudo apt-get install smplayer
<strong>
安装java环境支持（可选）</strong>

sudo apt-get install sun-java6-jre
sudo apt-get install sun-java6-jdk

设置当前默认的java解释器
sudo update-alternatives --config java

输入包含 "sun" 的行前的数字，回车确定。

配置JAVA环境变量:

sudo gedit /etc/environment

在其中添加如下两行：

CLASSPATH=/usr/lib/jvm/java-6-sun/lib
JAVA_HOME=/usr/lib/jvm/java-6-sun

sudo gedit /etc/jvm

将文件中的

/usr/lib/jvm/java-6-sun

这一行填入到配置块的顶部

安装浏览器的JAVA Plugin（可选）：

sudo apt-get install sun-java6-plugin

<strong> 安装Firefox插件</strong>

推荐几个：
<a href="http://www.google.com/tools/firefox/toolbar/FT3/intl/en/" target="_blank"> Google toolbar for firefox</a>
<a href="https://addons.mozilla.org/en-US/firefox/addon/4866" target="_blank"> Better Gmail</a>
<a href="https://addons.mozilla.org/en-US/firefox/addon/5362" target="_blank"> Alexa Sparky</a>

<strong>修改源</strong>

由于我同学在国外，用国内的源速度可能较慢，于是把sources,list里cn99的源注释掉（方法：每行前面加#）<strong>
</strong>
到此基本搞定。

全面检查了一下，发现Gutsy对T43支持得很好，无线网卡，声音，视频都没问题，只是3D效果打开的时候经常死机-,-

总之还算完美，第一次帮别人装linux，得意一下 :D

references:<a href="http://wiki.ubuntu.org.cn/%E5%BF%AB%E9%80%9F%E8%AE%BE%E7%BD%AE%E6%8C%87%E5%8D%97/FeistyFawn#.E5.AE.89.E8.A3.85.E5.A4.9A.E5.AA.92.E4.BD.93.E8.A7.A3.E7.A0.81.E5.99.A8" target="_blank">
快速设置指南/FeistyFawn</a>: 虽然是7.04，很多东西差异不大，注意源里把feisty改成gutsy就好
<a href="http://zhangtao.info/ubuntu/fcitx-kde-en-locale.pala" style="color:#444444;">KDE下fcitx的安装及设置 （Feisty和Gutsy）</a> : 虽然是KDE下，除了文本编辑器不一样，其他都一样的:)
