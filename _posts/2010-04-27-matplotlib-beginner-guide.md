---
layout: post
title: matplotlib新手教程
tags:
- matplotlib
- programming
- python
status: publish
type: post
published: true
meta:
  views: '733'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
  _searchme: '1'
---
<a href="http://matplotlib.sourceforge.net/" target="_blank">matplotlib</a>是绘制二维图形的Python模块，它用Python语言实现了MATLAB画图函数的易用性，同时又有非常强大的可定制性。可以看一下用matplotlib绘制的<a href="http://matplotlib.sourceforge.net/gallery.html" target="_blank">图像展示</a>。

<a href="http://www.plantcell.org/cgi/content/short/tpc.110.073882?keytype=ref&amp;ijkey=ChuzaZwudrANgEF" target="_blank">我的paper</a>里的图3，4和6就是用matplotlib画的啦。

好东东当然要大家分享，于是下面简单的写个教程，希望对Python有兴趣的或者熟悉MATLAB想找个替代品的筒子们有用。

首先，需要下载个<a href="http://ipython.scipy.org/moin/Download" target="_blank">ipython</a>，ipython是Python终端，支持图形的交互更新。（本文建议安装 ipython，完全是为了方便演示，其实只要本地安装了matplotlib，不需要 ipython 也可以画图的啦。） <a href="http://ipython.scipy.org/doc/rel-0.10/html/install/index.html" target="_blank">安装好</a>之后，在终端运行 <span style="color:#0000ff;">ipython -pylab</span>，于是ipython就导入了matplotlib，显示如下界面:
<pre>azalea@azalea-laptop:~$ ipython -pylab
Python 2.6.4 (r264:75706, Dec  7 2009, 18:45:15)
Type "copyright", "credits" or "license" for more information.

IPython 0.10 -- An enhanced Interactive Python.
?         -&gt; Introduction and overview of IPython's features.
%quickref -&gt; Quick reference.
help      -&gt; Python's own help system.
object?   -&gt; Details about 'object'. ?object also works, ?? prints more.

  Welcome to pylab, a matplotlib-based Python environment.
  For more information, type 'help(pylab)'.

In [1]:</pre>
输入 <span style="color:#0000ff;">plot([1,2,4,8,16])</span>

此时应该弹出图形窗口


![](https://dl.dropboxusercontent.com/u/308058/blogimages/2010/07/f1.png)
<span style="color:#0000ff;">x = range(-4,5)</span>

In [3]: <span style="color:#0000ff;">y = [elem**2 for elem in x]</span>

In [4]: <span style="color:#0000ff;">plot(x,y)</span>

大家此时应该看到弹出的窗口里多了一条绿色抛物线。

如果我觉得绿色抛物线不爽怎么办呢？只要给plot()函数更多一些参数，就可以方便的改变线的颜色粗细和风格啦。

<span style="color:#0000ff;">plot(x,y,color='red', linestyle='dashed', marker='o')</span>

或者简单的写成

<span style="color:#0000ff;">plot(x,y,'ro--')</span>

都会画出一条红色虚线连接的红色圆点。注意现在看起来很奇怪，因为这条线和之前画的绿色抛物线重合了，可以 Ctrl+D 退出 ipython再重新进入，输入

In [1]: <span style="color:#0000ff;">x = range(-4,5)</span>

In [2]: <span style="color:#0000ff;">y = [elem**2 for elem in x]</span>

In [3]: <span style="color:#0000ff;">plot(x,y,'ro--')</span>


![](https://dl.dropboxusercontent.com/u/308058/blogimages/2010/07/f2.png)
<a href="http://matplotlib.sourceforge.net/api/axes_api.html#matplotlib.axes.Axes.plot" target="_blank">参考这里</a>

此外，你可以一句话画出<a href="http://zh.wikipedia.org/zh/%E7%9B%B4%E6%96%B9%E5%9B%BE" target="_blank">直方图</a> (<a href="http://en.wikipedia.org/wiki/Histogram" target="_blank">histogram</a>)：

In [4]: <span style="color:#0000ff;">mu, sigma = 200, 25</span>

In [5]: <span style="color:#0000ff;">x = mu + sigma*randn(10000)</span> #前两行是数据，不算。。

In [6]: <span style="color:#0000ff;">hist(x, 50, normed=1)</span>

详见<a href="http://matplotlib.sourceforge.net/examples/pylab_examples/histogram_demo_extended.html" target="_blank">示例</a>和<a href="http://matplotlib.sourceforge.net/api/pyplot_api.html#matplotlib.pyplot.hist" target="_blank">文档</a>

一句话画出柱状图

In [7]: <span style="color:#0000ff;">Means = (20, 35, 30, 35, 27)</span>

In [8]: <span style="color:#0000ff;">Std =   (2, 3, 4, 1, 2)</span> #前两行还是数据，仍然不算。。

In [9]: <span style="color:#0000ff;">bar(range(len(Means)), Means, color='r', yerr=Std)</span>

详见<a href="http://matplotlib.sourceforge.net/examples/api/barchart_demo.html" target="_blank">示例</a>和<a href="http://matplotlib.sourceforge.net/api/pyplot_api.html#matplotlib.pyplot.bar" target="_blank">文档</a>

-------------------------------------------------------------------------------

下面要讲高级的东东啦

前面我们看到只要一个plot()函数就能画出整个图啦，但其实 matplotlib在背后做了很多事。

首先，matplotlib自动创建了一个Figure对象，然后在Figure之上有创建了一个Axes对象，在Axes对象之上才用plot()函数创建了一个Line2D对象。详见<a href="http://matplotlib.sourceforge.net/users/artists.html" target="_blank">文档</a>。

我们可以手动创建Figure对象和Axes对象，并可以保存这些对象，用于以后的定制。

在 ipython 里，输入：

<span style="color:#0000ff;">fig = plt.figure()</span>

手动创建一个Figure对象。

<span style="color:#0000ff;">ax = fig.add_subplot(111)</span>

在Figure之上，手动创建了一个Axes对象，我们用ax指向这个对象，便于以后操作。

如果窗口没有变化，可以输入

<span style="color:#0000ff;">show()</span>

立刻刷新窗口

此时可以输入

<span style="color:#0000ff;">ax.get_xlim()</span>

获得Axes的x坐标范围，默认是 (0.0, 1.0)

下面用plot()函数在Axes上画线，返回值是一个python list，于是把list的第一个元素（即第一条线）赋值给变量line

<span style="color:#0000ff;">line, = ax.plot([1,2,4,8,16])</span>

<span style="color:#0000ff;">show()</span>

<span style="color:#0000ff;"> </span>此时x和y坐标的范围随着数据自动改变了。

<span style="color:#0000ff;">ax.get_xlim() </span>的值是 (0.0, 4.0)

此时我觉得应该

此时我想改变 x坐标轴上的文字颜色，

许多方法都殊途同归

方法一：

<span style="color:#0000ff;">setp(ax.get_xticklabels(),color='g')</span>

方法一变种 （MATLAB风格）：

<span style="color:#0000ff;">setp(ax.get_xticklabels(),'color', 'g')</span>

详见<a href="http://matplotlib.sourceforge.net/api/artist_api.html#matplotlib.artist.setp" target="_blank">文档</a>

方法二：
<pre><span style="color:#0000ff;">for label in ax.get_xticklabels():
    label.set_color('g')</span></pre>
我想把y轴变成log-scale的，很简单：

<span style="color:#0000ff;">yscale('log')</span>

于是现在查看y轴的scale，

<span style="color:#0000ff;">ax.get_yscale()</span> 的结果是 'log'，而 <span style="color:#0000ff;">ax.get_xscale()</span> 的结果是 'linear'

如果我觉得还是linear scale好，怎么改回去呢？

你猜对了，是  <span style="color:#0000ff;">yscale('linear')</span>

忽然想把前面plot()画的line给改一下，于是

<span style="color:#0000ff;">setp(line, color='orange', linestyle='-.', marker='^'))</span>

或者

<span style="color:#0000ff;">setp(line, ’color‘,'orange', 'linestyle','-.', 'marker','^'))</span>

或者罗嗦的方法：

<span style="color:#0000ff;">line.set_color('orange')</span>

<span style="color:#0000ff;">line.set_linestyle('-.')</span>

<span style="color:#0000ff;">line.set_marker('^')
</span>

发现matplotlib真是无所不能改，我于是想搞点恶作剧，恩，就把x轴的标记放大吧。

这又有N种方法：

方法一：
<pre><span style="color:#0000ff;">for line in ax.get_xticklines():
    line.set_markeredgewidth(2)
    line.set_markersize(20)</span></pre>
方法二：

<span style="color:#0000ff;">setp(ax.get_xticklines(),markeredgewidth=2,markersize=20)</span>

以上都是通过Axes来修改Tick对象的属性

而下面的方法是直接修改Tick对象的属性，殊途同归啦

方法三：
<pre><span style="color:#0000ff;">for line in ax.xaxis.get_ticklines():
    line.set_markeredgewidth(2)
    line.set_markersize(20)</span></pre>
详见<a href="http://matplotlib.sourceforge.net/users/artists.html#tick-containers" target="_blank">文档</a>

把上面例子里的某些x换成y，就可以修改y坐标轴的对应属性啦。

经过这一番折腾，现在的图形应该长成这样：


![](http://azaleasays.files.wordpress.com/2010/04/f3.png)
<a href="http://azaleasays.files.wordpress.com/2010/04/f3.png2008/06/18/fomula-of-love/" target="_blank">代码在此</a>：

![](http://azaleasays.files.wordpress.com/2010/04/f3.pngwp-content/uploads/2008/06/love.png)

以上只涉及了matplotlib的万分之一，希望看到这里还有兴趣的筒子们自行去学习<a href="http://matplotlib.sourceforge.net/gallery.html" target="_blank">示例</a>和<a href="http://matplotlib.sourceforge.net/contents.html" target="_blank">文档</a>，画图愉快～
