---
layout: post
title: 如何设置环境变量
tags:
- linux
- ubuntu
- 环境变量
status: publish
type: post
published: true
meta:
  views: '3024'
  _wp_old_slug: '%e5%a6%82%e4%bd%95%e8%ae%be%e7%bd%ae%e7%8e%af%e5%a2%83%e5%8f%98%e9%87%8f'
---
翻译自<a href="http://www.cs.hmc.edu/qref/changevar.html" target="_blank">这篇文章</a>,感谢<a href="http://www.ztpala.com" target="_blank">pala</a>的技术指导 :)
<h3>环境变量是啥呢？</h3>
环境变量为你的shell储存各种默认值，使你的生活更加轻松。环境变量储存这样一些信息：你的home目录在哪里，你喜欢的文本编辑器，运行程序时要查找的目录等。如果你没有设置PATH这个环境变量，你就需要运行/usr/local/bin/programname 或 /usr/sbin/programname 或这个程序所在的其他目录，而不能简单地通过输入程序名运行它。

在sch或tcsh中，输入setenv命令可以显示所有的环境变量;在bash中，则输入export命令。如果要查看特定环境变量的值，则输入echo $VARIABLENAME。

一些环境变量的例子：
* <strong>PATH</strong> -- 设置运行程序时要查找的目录
* <strong>HOME</strong> -- 设置home目录的位置
* <strong>EDITOR, VISUAL, TEXEDIT</strong> -- 设置浏览和编辑文件的程序
*<strong> LD_LIBRARY_PATH</strong> -- 设置运行程序时需要查找的库文件目录
* <strong>HOST, HOSTTYPE, VENDOR, OSTYPE, MACHTYPE, REMOTEHOST</strong> -- 这些是操作系统的主机名和其他信息
* <strong>LINES, COLUMNS</strong> -- 设置终端的大小
* <strong>INFOPATH, MANPATH</strong> -- 设置查找info文件和man pages的目录
* <strong>MAIL</strong> -- 设置信箱的位置
* <strong>JAVA_HOME, JAVA_FONTS, JAVA_COMPILER, CLASSPATH</strong> -- 设置Java编程环境。CLASSPATH是这些变量里唯一需要我们手动设置的。 CLASSPATH设置java程序运行所需的java *.class文件的位置。如果你的classpath有问题, 试试把它设置为 /usr/local/java-classes
* <strong>TERM</strong> -- 设置你运行的终端类型
* <strong>TZ</strong> -- 设置当地时区
* <strong>SHELL</strong> -- 设置你的默认shell
还有许多环境变量没有列出。想最快了解它们的话，问问了解的人或者搜索网络吧。
<h3>为什么要修改环境变量？</h3>
如果你总是输入/usr/sbin/nslookup，或者一个程序仅安装了一遍但你每次调用它都要输入完整路径，你也许该修改你的PATH变量了。如果你想运行一个程序但它不停抱怨找不到需要的库或java类库，你也许该修改LD_LIBRARY_PATH或 CLASSPATH。当你创建你的账户时环境变量的值已经被设定好了，但是也许某天你想换换口味。此外，修改环境变量比输入完整路径或为了找到正确的库而修改源程序要简单得多。
<h3>怎么修改环境变量呢？</h3>
<!--more-->

<strong>在csh/tcsh中:</strong>

如果你想暂时设置环境变量（即环境变量只对当前会话有效，当你登出后再登录它就恢复为之前的默认值），输入命令:
<font color="#3366ff">setenv VARIABLENAME "value"</font>

例如，你想让path先查找/bin目录，然后/usr/bin, 然后 /usr/sbin, 然后 /usr/scb/bin，则输入：
<font color="#3366ff">setenv PATH "/bin:/usr/bin:/usr/sbin:/usr/ucb/bin"</font>

如果你想每次登录时都设置变量，你需要把上面的setenv命令行添加到home目录的.schrc文件。如果这个变量已经存在，你应该修改变量的值而不是添加另一行。运行.schrc使修改应用到当前会话。

<strong>在bash中:</strong>

暂时设置环境变量，输入：
<font color="#3366ff">export VARIABLENAME="value"</font>

例如，要设置和csh/tcsh例子中同样的path，则输入：
<font color="#3366ff">export PATH="/bin:/usr/bin:/usr/sbin:/usr/ucb/bin"</font>

同csh/tcsh中一样，要使变量对所有会话有效，你需要把它添加到home目录的.bashrc文件中，然后运行
source .bashrc使修改应用到当前会话。

<strong>在其他shell中:</strong>

大多数shell可以使用setenv或export中的一个。具体情况请查阅你的shell的man page。
