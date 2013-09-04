---
layout: post
title: 找钱问题--动态规划一例
tags:
- algorithm
- dynamic programming
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  aktt_notify_twitter: 'no'
  _edit_last: '1'
  _efficient_related_posts: a:10:{i:0;a:4:{s:2:"ID";s:4:"1812";s:10:"post_title";s:35:"Maximum
    sum of consecutive integers";s:7:"matches";s:1:"3";s:9:"permalink";s:69:"http://azaleasays.com/2011/02/17/maximum-sum-of-consecutive-integers/";}i:1;a:4:{s:2:"ID";s:4:"1792";s:10:"post_title";s:30:"Cannot
    find python intepreter ";s:7:"matches";s:1:"1";s:9:"permalink";s:63:"http://azaleasays.com/2011/01/15/cannot-find-python-intepreter/";}i:2;a:4:{s:2:"ID";s:4:"1776";s:10:"post_title";s:42:"python判断字符串是否是回文结构";s:7:"matches";s:1:"1";s:9:"permalink";s:61:"http://azaleasays.com/2010/12/11/python-string-is-palindrome/";}i:3;a:4:{s:2:"ID";s:4:"1762";s:10:"post_title";s:50:"matplotlib绘图实例3：染色体直线示意图";s:7:"matches";s:1:"1";s:9:"permalink";s:74:"http://azaleasays.com/2010/12/02/matplotlib-example-lines-for-chromosomes/";}i:4;a:4:{s:2:"ID";s:4:"1715";s:10:"post_title";s:24:"Python菊花文转换器";s:7:"matches";s:1:"1";s:9:"permalink";s:90:"http://azaleasays.com/2010/10/11/python-converter-for-juhuaren-html-character-entity-1161/";}i:5;a:4:{s:2:"ID";s:4:"1687";s:10:"post_title";s:40:"Python保留list只出现一次的元素";s:7:"matches";s:1:"1";s:9:"permalink";s:76:"http://azaleasays.com/2010/08/30/python-keep-list-elements-that-appear-once/";}i:6;a:4:{s:2:"ID";s:4:"1420";s:10:"post_title";s:30:"用Python漂亮地打印序列";s:7:"matches";s:1:"1";s:9:"permalink";s:72:"http://azaleasays.com/2010/07/15/print-sequence-beatifully-using-python/";}i:7;a:4:{s:2:"ID";s:4:"1407";s:10:"post_title";s:25:"在Python中调用RNAfold";s:7:"matches";s:1:"1";s:9:"permalink";s:55:"http://azaleasays.com/2010/05/19/use-rnafold-in-python/";}i:8;a:4:{s:2:"ID";s:4:"1371";s:10:"post_title";s:36:"matplotlib绘图实例2：color
    mesh";s:7:"matches";s:1:"1";s:9:"permalink";s:63:"http://azaleasays.com/2010/04/29/matplotlib-example-color-mesh/";}i:9;a:4:{s:2:"ID";s:4:"1374";s:10:"post_title";s:38:"matplotlib绘图实例1：scatter
    plot";s:7:"matches";s:1:"1";s:9:"permalink";s:65:"http://azaleasays.com/2010/04/28/matplotlib-example-scatter-plot/";}}
  _relation_threshold: '1'
  original_post_id: '1804'
  _wp_old_slug: '1804'
---
用无限多的面值为 S = {S1, S2,  ..., Sm} 的分币，表示一个特定的分值n，有多少种方法？这个就是找钱问题 (<a href="http://www.algorithmist.com/index.php?title=Coin_Change" target="_blank">Coin Change Problem</a>)。

比如，用 1美分 和 5 美分，表示7美分，有2种方法，第一种是1个5美分，2个1美分；第二种是7个1美分。

因为顺序对结果没有影响，即“1个5美分，2个1美分”和“2个1美分，1个5美分”是一样的，我们限定 S1 &lt; S2 &lt; ... &lt; Sm。用递归的方法，解法的数量 C(n, m)，可以分成2类：

一类是表示方法里不需要 Sm的，另一类是表示方法里需要Sm的。如上面的例子，一类表示是需要5美分，另一类不需要。

于是，递归公式如下：

C(n, m) = C(n, m-1) + C(n-Sm, m)

Python代码：
<pre>
def count1(n,m):
    global numCalls
    numCalls += 1
    global S
    if n == 0:
        return 1
    if n &lt; 0:
        return 0
    if m == 1:
        return 1
    return count1(n, m-1) + count1(n-S[m-1],m)

S = (1,5,10,25)
numCalls = 0
print count1(100,len(S))
print numCalls
</pre>
count1()函数的运行结果是242，即用 1美分，5美分，10美分和25美分表示100美分有242种方法。
numCalls是13927，说明count1()函数被调用了13927次。这是因为我们重复计算了很多相同的中间结果。

这个问题可以用 <a href="http://zh.wikipedia.org/zh/%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92" target="_blank">动态规划</a> (<a href="http://en.wikipedia.org/wiki/Dynamic_programming" target="_blank">Dynamic Programming</a>)来解决，关于动态规划推荐看 <a href="http://www.youtube.com/watch?v=ZKBUu_ahSR4" target="_blank">MIT 6.00 Introduction to Computer Science and Programming Lec 13</a>。

动态规划应用于以下情况：子问题的最优解也是整体问题的最优解，同时子问题有重叠。那么就可以把子问题的解保存起来，只需要计算一次就可以。

于是：
<pre>
def count(n,m):
    global numCalls
    numCalls += 1
    global S
    global memo
    try:
        return memo[(n,m)]
    except KeyError:
        if n == 0:
            memo[(n,m)] = 1
            return 1
        if n &lt; 0:
            memo[(n,m)] = 0
            return 0
        if m == 1:
            memo[(n,m)] = 1
            return 1
    memo[(n,m)] = count(n, m-1) + count(n-S[m-1],m)
    return memo[(n,m)]

S = (1,5,10,25)
memo = {}
numCalls = 0
print count(100,len(S))
print numCalls
</pre>
count()函数和count1()函数的唯一区别就是count()函数用一个字典 memo 记录了子问题的解。因此运行结果是一样的，都是242；
但是numCalls是285，说明count()函数仅被调用了285次。这就是动态规划保存子问题的解的神奇结果。
