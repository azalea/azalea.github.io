---
layout: post
title: python条件运算符
tags:
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '880'
---
许多其他语言中都有条件运算符(conditional operator)，形如cond?a:b，意思是if cond==TRUE: a else: b
由于这个运算符有三个操作数，因此叫做三目运算符(ternary operator)

python里的<a href="http://hgoldfish.mysmth.net/2008/04/07/python%E7%9A%84%E6%9D%A1%E4%BB%B6%E8%BF%90%E7%AE%97%E7%AC%A6/" target="_blank">条件运算符形式</a>如下：
<span style="color:#2c86a9;">&gt;&gt;&gt;a if cond else b</span>
它的优先级仅次于赋值符号，是倒数第二低的

此外还有人建议一个条件运算符的替代形式：
<span style="color:#2c86a9;"> &gt;&gt;&gt;cond and a or b</span>
原理可以看<a href="http://liulu.javaeye.com/blog/70672" target="_blank">这里</a>。
但是这样会有问题，因为当a是0，空字符串""，空列表[]，空字典{}，空元组()或None时，python会认为其值为False，从而得不到想要的结果。
<span style="color:#2c86a9;"> &gt;&gt;&gt; cond, a, b = True, 0, 1</span> #这样赋值后
<span style="color:#2c86a9;">&gt;&gt;&gt; cond and a or b</span> #这个表达式的结果不是a而是b
解决方法：
<span style="color:#2c86a9;"> &gt;&gt;&gt; (cond and [a] or [b])[0]</span> #因为[0]不是False的
