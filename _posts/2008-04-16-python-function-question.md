---
layout: post
title: python函数的问题呀。。
tags:
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '653'
---
没时间查暂时，记下来先

如果一个函数的目的是改变字典中一个key的值，我是传递这个值进去，还是传递整个字典进去？

如果我传递字典进去，是引用传递还是值传递？在函数里改变key的值， 如果没有返回值，那么原来的字典到底有没有改变？

如果不改变，那么怎么才能引用传递参数，或者说传递参数的地址给函数？

答案：<span style="text-decoration:line-through;">是引用传递啦</span>

2008.11.4更正，是值传递，但是对于list等可变对象，表现为引用传递，因为向函数传递的值是个引用。

详见<a href="http://py.azpala.com/?p=38" target="_blank">http://py.azpala.com/?p=38</a>
