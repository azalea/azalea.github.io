---
layout: post
title: Python菊花文转换器
tags:
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
    sum of consecutive integers";s:7:"matches";s:1:"1";s:9:"permalink";s:69:"http://azaleasays.com/2011/02/17/maximum-sum-of-consecutive-integers/";}i:1;a:4:{s:2:"ID";s:4:"1804";s:10:"post_title";s:32:"找钱问题--动态规划一例";s:7:"matches";s:1:"1";s:9:"permalink";s:91:"http://azaleasays.com/2011/02/16/coin-change-problem-an-application-of-dynamic-programming/";}i:2;a:4:{s:2:"ID";s:4:"1792";s:10:"post_title";s:30:"Cannot
    find python intepreter ";s:7:"matches";s:1:"1";s:9:"permalink";s:63:"http://azaleasays.com/2011/01/15/cannot-find-python-intepreter/";}i:3;a:4:{s:2:"ID";s:4:"1776";s:10:"post_title";s:42:"python判断字符串是否是回文结构";s:7:"matches";s:1:"1";s:9:"permalink";s:61:"http://azaleasays.com/2010/12/11/python-string-is-palindrome/";}i:4;a:4:{s:2:"ID";s:4:"1762";s:10:"post_title";s:50:"matplotlib绘图实例3：染色体直线示意图";s:7:"matches";s:1:"1";s:9:"permalink";s:74:"http://azaleasays.com/2010/12/02/matplotlib-example-lines-for-chromosomes/";}i:5;a:4:{s:2:"ID";s:4:"1687";s:10:"post_title";s:40:"Python保留list只出现一次的元素";s:7:"matches";s:1:"1";s:9:"permalink";s:76:"http://azaleasays.com/2010/08/30/python-keep-list-elements-that-appear-once/";}i:6;a:4:{s:2:"ID";s:4:"1420";s:10:"post_title";s:30:"用Python漂亮地打印序列";s:7:"matches";s:1:"1";s:9:"permalink";s:72:"http://azaleasays.com/2010/07/15/print-sequence-beatifully-using-python/";}i:7;a:4:{s:2:"ID";s:4:"1407";s:10:"post_title";s:25:"在Python中调用RNAfold";s:7:"matches";s:1:"1";s:9:"permalink";s:55:"http://azaleasays.com/2010/05/19/use-rnafold-in-python/";}i:8;a:4:{s:2:"ID";s:4:"1371";s:10:"post_title";s:36:"matplotlib绘图实例2：color
    mesh";s:7:"matches";s:1:"1";s:9:"permalink";s:63:"http://azaleasays.com/2010/04/29/matplotlib-example-color-mesh/";}i:9;a:4:{s:2:"ID";s:4:"1374";s:10:"post_title";s:38:"matplotlib绘图实例1：scatter
    plot";s:7:"matches";s:1:"1";s:9:"permalink";s:65:"http://azaleasays.com/2010/04/28/matplotlib-example-scatter-plot/";}}
  _relation_threshold: '1'
  original_post_id: '1715'
  _wp_old_slug: '1715'
---
感谢<a href="http://www.google.com/buzz/111023315324180581642/KeFJ984czcE/azaleasays-%E8%80%81%E5%AD%90%E5%9C%A8%E6%96%B0%E6%B5%AA%E5%8F%91%E4%B8%80%E6%9D%A1%E5%BE%AE%E5%8D%9A" target="_blank">Meng Li</a>同学莅临指导，我发现世界上除了火星文，还有菊花文（又名金星文，大概是看得眼冒金星的意思）

据说谷歌输入法可以输入，但是作为Linux党只好自己动手：
<pre>import sys

inputstr = sys.argv[1]
inputlist = list(inputstr.decode('utf-8'))

# print repr('&#1161;'.decode('ascii', 'xmlcharrefreplace'))
# Find the unicode for html character entity &#1161;
# It turns out to be u'&#1161;'

decoration = u'&#1161;'
encodedString = decoration + decoration.join(inputlist) + decoration

from BeautifulSoup import BeautifulStoneSoup
decodedString=unicode(BeautifulStoneSoup(encodedString,
    convertEntities=BeautifulStoneSoup.HTML_ENTITIES ))

print decodedString</pre>
用法：

azalea@azalea-Ubuntu:~$ python test.py 菊花文是个好东东
<pre>菊҉花҉文҉是҉个҉好҉东҉东҉</pre>
原理：

菊花文其实就是在字符中间加入一个<a href="http://www.w3schools.com/html/html_entities.asp">html character entity</a> 即 <a href="http://www.whatsmyip.org/htmlcharacters/?full=yes" target="_blank">&#1161; </a>

Python做的就是读入正常的中文，每个字符之间插入这个符号，然后<a href="http://channel3b.wordpress.com/2007/07/04/how-to-convert-html-entities-to-real-unicode-in-python/" target="_blank">转换成 "real" unicode</a>输出。最后的转换需要第三方包 <a href="http://www.crummy.com/software/BeautifulSoup/" target="_blank">BeautifulSoup</a>

或者可以参考<a href="http://effbot.org/zone/re-sub.htm#unescape-html" target="_blank">这里</a>，自己写个函数

p.s. 偶觉得这个依然还是很容易被机器过滤的，还是火星文靠谱啊
