---
layout: post
title: 如何在英文环境下安装fcitx  zz
tags:
- ubuntu
- 输入法
status: publish
type: post
published: true
meta:
  views: '530'
  _wp_old_slug: '%e5%a6%82%e4%bd%95%e5%9c%a8%e8%8b%b1%e6%96%87%e7%8e%af%e5%a2%83%e4%b8%8b%e5%ae%89%e8%a3%85fcitx-zz'
---
zz from <a href="http://www.forwind.cn/2007/04/29/fictx/" target="_blank">这里</a>不错的blog 我的输入法问题就是这样解决的

只是速度也太慢了。。大家搜索到同样标题的文章就来我这里看吧。。

以下为转载:

当初为了使用eda工具而不在终端下显示那么多警告，把实验室的机器整成了英文环境的ubuntu，啥都正常，就是不能用自己编译的fcitx。寻觅了很久，终于得出解决办法。现在虽然已经换回704的中文环境了，但是还是放出方法如下：

1 安装fcitx包，从源里安装3.1或者自己编译最新的3.4版都可以，总之是要安上。值得注意的一点是，安装完毕后在 /etc/X11/xinit/xinput.d/下应该有一个fcitx文件，这个是之后的im-swith需要用到的。如果从源里安装这个文件会自动 生成，如果是自己编译安装，可能需要自己建立这个文件，内容为：

XIM=fcitx
XIM_PROGRAM=/usr/bin/fcitx
XIM_ARGS=”"
GTK_IM_MODULE=XIM
QT_IM_MODULE=XIM
DEPENDS=”fcitx”

还要注意一点，就是如果自己编译时不指定安装路径，默认的可执行文件会在/usr/local/bin而不是/usr/bin下，所以要么修改上面的XIM_PROGRAM一行，要么在/usr/bin下建个符号链接。

2 然后，确认安装了im-switch，如果没有就apt安装一下。之后运行：

im-switch -s fcitx

如果成功，会有如果提示：

From the package dependency information, following packages
may be useful to install:
“fcitx”

如果没成功，看下第一点的注意事项。

3 做完以上步骤后理论上已经配置好了fcitx的环境，当locale设置为zh_CN*的时候，可以不设置XMODIFIERS。当为en_US.utf -8时，必须设置XMODIFIERS，否则将无法工作，因为所有的gtk程序在完成以上的配置后，默认的输入法仍然是“default”而不是“X Input Method（即XIM）”。注意一下输入区域的右键菜单“Input Method”项，就会发现这一点，而此时如果你从那个菜单里选择“X Input Method”，输入法就可以成功调出来了。

现在的问题是怎么让系统把GTK程序的默认的输入法设置成XIM而不需要你自己每次手动从菜单里改（何况在firefox这种程序里，右键菜单都没 有Input Method那项）。在LinuxSir上有人提出过修改.bashrc或者.bash_profile文件，加入export GTK_IM_MODULE=XIM的方法。我试过，不管改的是哪个文件都不起作用。今天看到这一贴，提到了一个十分牛逼的方法，即修改/etc/gtk -2.0/gtk.immodules文件，把有关xim的部分改成：

“/usr/lib/gtk-2.0/2.4.0/immodules/im-xim.so”
“xim” “X Input Method” “gtk20″ “/usr/share/locale” “en:ko:ja:th:zh”

多加上的en就会使GTK程序在en_US的环境下也启用xim作为输入法了。

4 你经常会遇到的问题如下：

FCITX — Get signal NO.:11 FCITX — Exit signal NO.:11
这种问题通常是在安装新版本之前没有删除home目录下的.fcitx目录所导致。只有删除后重新安装才能继续使用。

im-switch的时候提示
Please install following packages:
“( fcitx )”
这个问题很奇怪，我也不清楚怎么回事，但是不会影响使用，反正不管就行了。

5 小知识：怎样设定locale呢？

设定locale就是设定12大类的locale分类属性，即 12个LC_*。除了这12个变量可以设定以外，为了简便起见，还有两个变量： LC_ALL和LANG。它们之间有一个优先级的关系： LC_ALL&gt;LC_*&gt;LANG 可以这么说，LC_ALL是最上级设定或者强制设定，而LANG是默认设定值。 1、如果你设定了LC_ALL＝zh_CN.UTF-8，那么不管LC_*和LANG设定成什么值，它们都会被强制服从 LC_ALL的设定，成为 zh_CN.UTF-8。 2、假如你设定了LANG＝zh_CN.UTF-8，而其他的LC_*=en_US.UTF-8，并且没有设定LC_ALL的话，那么系统的locale 设定以LC_*=en_US.UTF-8。 3、假如你设定了LANG＝zh_CN.UTF-8，而其他的LC_*，和LC_ALL均未设定的话，系统会将LC_*设定成默认值，也就是LANG的值 zh_CN.UTF-8 。 4、假如你设定了 LANG＝zh_CN.UTF-8，而其他的LC_CTYPE=en_US.UTF-8，其他的LC_*，和LC_ALL均未设定的话，那么系统的 locale设定将是：LC_CTYPE=en_US.UTF-8，其余的 LC_COLLATE，LC_MESSAGES等等均会采用默认值，也就是 LANG的值，也就是LC_COLLATE＝LC_MESSAGES＝……＝ LC_PAPER＝LANG＝zh_CN.UTF-8。

所以，locale是这样设定的： 1、如果你需要一个纯中文的系统的话，设定LC_ALL= zh_CN.XXXX，或者LANG= zh_CN.XXXX都可以，当然你可以两个都设定，但正如上面所讲，LC_ALL的值将覆盖所有其他的locale设定，不要作无用功。 2、如果你只想要一个可以输入中文的环境，而保持菜单、标题，系统信息等等为英文界面，那么只需要设定LC_CTYPE＝zh_CN.XXXX，LANG = en_US.XXXX就可以了。这样LC_CTYPE＝zh_CN.XXXX，而LC_COLLATE＝LC_MESSAGES＝……＝ LC_PAPER＝LANG＝en_US.XXXX。 3、假如你高兴的话，可以把12个LC_*一一设定成你需要的值，打造一个古灵精怪的系统： LC_CTYPE＝zh_CN.GBK/GBK(使用中文编码内码GBK字符集)； LC_NUMERIC=en_GB.ISO-8859-1(使用大不列颠的数字系统) LC_MEASUREMEN=de_DE@euro.ISO-8859-15(德国的度量衡使用ISO-8859-15字符集) 罗马的地址书写方式，美国的纸张设定……。估计没人这么干吧。 4、假如你什么也不做的话，也就是LC_ALL，LANG和LC_*均不指定特定值的话，系统将采用POSIX作为lcoale，也就是C locale。

<span class="UTWPrimaryTags"></span>
