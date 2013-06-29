---
layout: post
title: 'Python: 去掉字符串中的非数字(或非字母)字符'
tags:
- programming
- python
- string
status: publish
type: post
published: true
meta:
  ratings_users: '2'
  ratings_score: '2'
  ratings_average: '1'
  views: '651'
---
&gt;&gt;&gt; crazystring = 'dade142.;!0142f[.,]ad'

只保留数字
&gt;&gt;&gt; filter(str.isdigit, crazystring)
'1420142'

只保留字母
&gt;&gt;&gt; filter(str.isalpha, crazystring)
'dadefad'

只保留字母和数字
&gt;&gt;&gt; filter(str.isalnum, crazystring)
'dade1420142fad'

如果想保留数字0-9和小数点'.' 则需要自定义函数

&gt;&gt;&gt; filter(lambda ch: ch in '0123456789.', crazystring)
'142.0142.'

或者使用正则表达式或循环

请参考<a href="http://stackoverflow.com/questions/947776/strip-all-non-numeric-characters-except-for-from-a-string-in-python" target="_blank">StackOverflow里的讨论</a>.
