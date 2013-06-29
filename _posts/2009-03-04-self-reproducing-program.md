---
layout: post
title: “打印自己”的程序
tags:
- programming
- python
- quine
status: publish
type: post
published: true
meta:
  _searchme: '1'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
  views: '640'
---
你能不能写出一个程序，它的输出结果是它本身？

这是我大四《计算理论》课的作业，可惜当时没做。

今天研究了下这个问题，结论是没研究明白，不过看到几个有意思的东东在这里唠叨一下。

其实，所有能输出可计算字符串（computable string)的编程语言，都可以写出“打印自己”的程序。这种程序术语叫做<a href="http://en.wikipedia.org/wiki/Quine_(computing)" target="_blank">Quine</a> （台湾译作<a href="http://zh.wikipedia.org/wiki/%E8%87%AA%E7%94%A2%E7%94%9F%E7%A8%8B%E5%BC%8F" target="_blank">自产生程式</a>），得名于对这种程序进行过深入研究的哲学家<a title="Willard Van Orman Quine" href="http://en.wikipedia.org/wiki/Willard_Van_Orman_Quine">Willard Van Orman Quine</a>。第一个Quine诞生于上世纪60年代的爱丁堡大学，之后大家开始用各种编程语言写Quine，<a class="external text" title="http://www.nyx.net/~gthompso/quine.htm" rel="nofollow" href="http://www.nyx.net/%7Egthompso/quine.htm">The Quine Page</a> 收集了很多，下面摘录几个python的。

在python终端：
&gt;&gt;&gt; <span style="color:#0000ff;">l='l=%s;print l%%`l`';print l%`l`</span>
l='l=%s;print l%%`l`';print l%`l`

&gt;&gt;&gt; <span style="color:#0000ff;">"x='x=%s;x%%`x`';x%`x`"</span>
"x='x=%s;x%%`x`';x%`x`"

以上都用到了python的repr()函数，或者`` (Tab键上面那个），repr函数的作用：
&gt;&gt;&gt; <span style="color:#0000ff;">print repr.__doc__</span>
repr(object) -&gt; string

Return the canonical string representation of the object.
For most object types, eval(repr(object)) == object.

也可以不用repr函数（当然就要多浪费好多引号。。 <a href="http://spikeypillow.com/item/31" target="_blank">来源</a>）：
&gt;&gt;&gt; <span style="color:#0000ff;">s="""print 's=""%s"";%s' %('"'+s+'"',s)""";print 's=""%s"";%s' %('"'+s+'"',s)</span>
s="""print 's=""%s"";%s' %('"'+s+'"',s)""";print 's=""%s"";%s' %('"'+s+'"',s)

Quine有长有短，比较长的有：
<pre><span style="color:#0000ff;">
q='"'
q1="'"
n='n'
s='\'
r1="def f(a,s1,s2,s3,s4):"
r2=" print a+'1='+q+s1+q+n+a+'2='+q+s2+q"
r3=" print a+'3='+q+s3+q+n+a+'4='+q+s4+q"
r4=" print s1+n+s2+n+s3+n+s4"
def f(a,s1,s2,s3,s4):
    print a+'1='+q+s1+q+n+a+'2='+q+s2+q
    print a+'3='+q+s3+q+n+a+'4='+q+s4+q
    print s1+n+s2+n+s3+n+s4
p1="print 'q='+q1+q+q1+n+'q1='+q+q1+q"
p2="print 'n='+q1+s+'n'+q1+n+'s='+q1+s+s+q1"
p3="f('r',r1,r2,r3,r4)"
p4="f('p',p1,p2,p3,p4)"
print 'q='+q1+q+q1+n+'q1='+q+q1+q
print 'n='+q1+s+'n'+q1+n+'s='+q1+s+s+q1
f('r',r1,r2,r3,r4)
f('p',p1,p2,p3,p4)</span>
</pre>
Geek们都追求最短的Quine程序，那么，世界上最短的Quine程序是啥？

答案是：

<!--more-->空程序！

因为空程序啥也没有，它的输出结果也是啥也没有，它仍然在输出结果里打印了自己（啥也没有）。

另：这个解答曾在<a class="mw-redirect" title="Obfuscated C" href="http://en.wikipedia.org/wiki/Obfuscated_C">Obfuscated C</a> 比赛上获得“最佳滥用规则”奖。

如果你要问，怎么写Quine程序捏？Quine程序的原理是啥？我还没研究出来，请前往<a href="http://en.wikipedia.org/wiki/Quine_(computing)" target="_blank">维基百科</a>学习。

参考文献：

1. Wikipedia. <a href="http://en.wikipedia.org/wiki/Quine_(computing)" target="_blank">http://en.wikipedia.org/wiki/Quine_(computing)</a>

2. The Quine Page. <a href="http://www.nyx.net/~gthompso/quine.htm" target="_blank">http://www.nyx.net/~gthompso/quine.htm</a>

3. Spikey Pillow. <a href="http://spikeypillow.com/item/31" target="_blank">http://spikeypillow.com/item/31</a>
