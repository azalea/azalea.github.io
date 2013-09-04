---
layout: post
title: Linux下保存R图像
tags:
- graphics
- programming
- R
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '728'
  ratings_score: '1'
  ratings_users: '1'
  ratings_average: '1'
---
Linux下在命令行运行R，调用画图的各种函数(如plot())后，打开的窗口没有保存选项。而windows下就可以。

于是以前很土鳖的一直用Acquire Screen shot来截取图像。。

今天发现Linux下可以很方便的保存R图像，比如:

&gt;png('myplot.png')

&gt;plot(x,y)

&gt;dev.off()

即需要先打开一个“设备驱动”，包括（以下复制粘贴自<a href="http://cran.r-project.org/doc/manuals/R-intro.html#Device-drivers" target="_blank">这里</a>）：
<blockquote><dl><dt><code>X11()</code></dt> <dd><a title="index-X11-283" name="index-X11-283"/>For use with the X11 window system on Unix-alikes </dd> <dt><code>windows()</code></dt> <dd><a title="index-windows-284" name="index-windows-284"/>For use on Windows </dd> <dt><code>quartz()</code></dt> <dd><a title="index-quartz-285" name="index-quartz-285"/>For use on MacOS X </dd> <dt><code>postscript()</code></dt> <dd><a title="index-postscript-286" name="index-postscript-286"/>For printing on PostScript printers, or creating PostScript graphics files. </dd> <dt><code>pdf()</code></dt> <dd><a title="index-pdf-287" name="index-pdf-287"/>Produces a PDF file, which can also be included into PDF files. </dd> <dt><code>png()</code></dt> <dd><a title="index-png-288" name="index-png-288"/>Produces a bitmap PNG file. (Not always available: see its help page.) </dd> <dt><code>jpeg()</code></dt> <dd><a title="index-jpeg-289" name="index-jpeg-289"/>Produces a bitmap JPEG file, best used for <code>image</code> plots.  (Not always available: see its help page.)</dd> </dl></blockquote>
“设备驱动”可以把用户输入的画图命令如plot()转换成对应设备可以理解的代码，

然后像往常一样使用画图函数，

最后不要忘记dev.off()，这是保证数据全部输出到设备并正常终止设备。
