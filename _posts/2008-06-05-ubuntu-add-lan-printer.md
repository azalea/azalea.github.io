---
layout: post
title: Ubuntu添加局域网打印机
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '2070'
---
System-&gt;Administration-&gt;Printing-&gt;New Printer

会自动搜索局域网内的打印机，选中需要连接的打印机（需要知道打印机的IP地址），然后选择打印机的model或者导入一个PostScript Printer Description (PPD) file，然后选择驱动，最后随便给打印机起个名字（当然你要认得）就搞定了。

下面是实例教学：

我想连接的打印机是Dell Laser Printer 1710n，选择好model后发现找不到对应的驱动。于是到<a href="http://support.euro.dell.com/support/downloads/driverslist.aspx?os=LIN4&amp;osl=EN&amp;catid=-1&amp;impid=-1&amp;servicetag=&amp;SystemID=PRN_LSR_1710N&amp;hidos=LE30&amp;hidlang=en" target="_blank">dell网站</a>去找，也只有.rpm格式的驱动。 虽然看到一篇介绍<a href="http://ubuntu.wordpress.com/2005/09/23/installing-using-an-rpm-file/" target="_blank">把.rpm转成.deb方法</a>的文章，但是我很懒。。

于是在师兄的帮助下，在<a href="http://ubuntuforums.org/showthread.php?t=107028&amp;highlight=dell+1710" target="_blank">Ubuntu论坛</a>上看到一个generic的PPD文件， 在添加打印机时直接导入就搞定啦。那个PPD文件需要登录Ubuntu论坛才可以下载，我在<a href="ftp://ftp.azpala.com/backup/printerPPD/dkaay1p1.ppd.gz">这里</a>提供一个不用登录的下载吧:)
