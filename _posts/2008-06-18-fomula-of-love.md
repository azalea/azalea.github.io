---
layout: post
title: 爱的方程
tags:
- matplotlib
- plot
- programming
- python
status: publish
type: post
published: true
meta:
  views: '770'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
  _searchme: '1'
---
爱的方程： 17x^2-16|x|y+17y^2=225

先从<a href="http://www.forwind.cn" target="_blank">风雷的技术天地</a>看到：<a href="http://www.forwind.cn/2008/06/09/draw-heart/" target="_blank">http://www.forwind.cn/2008/06/09/draw-heart/</a>

又寻根溯源找到<a href="http://www.matrix67.com/blog/" target="_blank">Matrix67</a>：<a href="http://www.matrix67.com/blog/archives/85" target="_blank">http://www.matrix67.com/blog/archives/85</a>

两个都是很赞的blog，推荐一下！（汗，跑题了。。）

原理很简单，就是画出方程 17x^2-16|x|y+17y^2=225  的图像：

<a href="http://azaleasays.com/wp-content/uploads/2010/07/love.png"><img src="http://azaleasays.com/wp-content/uploads/2010/07/love.png" alt="" width="550" height="414" /></a>

以下是代码（基本都是从风雷的技术天地那里抄来的，不过窃以为我的配色比较正常@@）

from pylab import *

def func1(x):
return ( 16*fabs(x) + sqrt( 15300 - (x**2) * 900 ) ) / 34
def func2(x):
return ( 16*fabs(x) - sqrt( 15300 - (x**2) * 900 ) )/ 34

x = arange( -5.0,5.0,0.001 )
plot(x,func1(x),c='r')
plot(x,func2(x),c='r')
show()

以上代码需要matplotlib，Ubuntu可以sudo apt-get install python-matplotlib

另外<a href="http://www.matrix67.com/blog/archives/223">这里</a>还有一个更高级的方程，不过比较丑陋。
