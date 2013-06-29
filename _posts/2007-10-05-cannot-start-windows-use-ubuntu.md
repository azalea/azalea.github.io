---
layout: post
title: 如果无法进入windows，用ubuntu吧
tags:
- ubuntu
- windows
status: publish
type: post
published: true
meta:
  views: '526'
  _wp_old_slug: '%e5%a6%82%e6%9e%9c%e6%97%a0%e6%b3%95%e8%bf%9b%e5%85%a5windows%ef%bc%8c%e7%94%a8ubuntu%e5%90%a7'
---
今天我朋友xp挂了，一开机就蓝屏。我说重装吧，结果1的硬盘竟然不分区的，他又想保留一些数据。他的电脑是Thinkpad T43，硬盘就是经典的hitachi硬盘。于是想到把硬盘拆下来装在硬盘盒里，用USB接到我的ubuntu里备份。
结果只能mount IBM_SERVICE，就是用于thinkpad标榜的一键恢复的隐藏分区。
另外一个装着系统和所有个人数据的分区，IBM_PRELOAD无法挂载
错误信息：
Unable to mount the volume 'IBM_PRELOAD'
Details:
Volume is scheduled for check. Please boot into Windows TWICE, or
use the 'force' mount option. For example type on the command line:
mount -t ntfs-3g /dev/sdb1 /media/IBM_PRELOAD -o force
Or add the option to the relevant row in the /etc/fstab file:
/dev/sdb1 /media/IBM_PRELOAD ntfs-3g defaults,force 0 0

结果试了
sudo mount -t ntfs-3g /dev/sdb1 /media/IBM_PRELOAD -o force
还不行

还是老公厉害，找来一篇文章拯救了硬盘，<a href="http://fedoraforum.org/forum/showthread.php?t=165799" target="_blank">请看这里</a>

方法如下：
sudo mkdir /media/windows
sudo mount -t ntfs-3g -o force /dev/sdb1 /media/windows
竟然就搞定了，我同学疾呼linux神奇！

（注：上面提到的文章中<span style="display:block;padding-left:6em;text-indent:-1em;"><span>sudo mount -t ntfs-3g -o ro /dev/sdb1 /media/windows</span></span>即用read only的方法mount，没有用）

btw，他的硬盘插在另外一台windows系统上是不能读的

最后说一句，用ubuntu吧！
