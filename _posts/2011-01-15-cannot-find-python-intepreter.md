---
layout: post
title: Cannot find python intepreter
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
  _wp_old_slug: '1792'
  _efficient_related_posts: a:10:{i:0;a:4:{s:2:"ID";s:4:"1812";s:10:"post_title";s:35:"Maximum
    sum of consecutive integers";s:7:"matches";s:1:"1";s:9:"permalink";s:69:"http://azaleasays.com/2011/02/17/maximum-sum-of-consecutive-integers/";}i:1;a:4:{s:2:"ID";s:4:"1804";s:10:"post_title";s:32:"找钱问题--动态规划一例";s:7:"matches";s:1:"1";s:9:"permalink";s:91:"http://azaleasays.com/2011/02/16/coin-change-problem-an-application-of-dynamic-programming/";}i:2;a:4:{s:2:"ID";s:4:"1776";s:10:"post_title";s:42:"python判断字符串是否是回文结构";s:7:"matches";s:1:"1";s:9:"permalink";s:61:"http://azaleasays.com/2010/12/11/python-string-is-palindrome/";}i:3;a:4:{s:2:"ID";s:4:"1762";s:10:"post_title";s:50:"matplotlib绘图实例3：染色体直线示意图";s:7:"matches";s:1:"1";s:9:"permalink";s:74:"http://azaleasays.com/2010/12/02/matplotlib-example-lines-for-chromosomes/";}i:4;a:4:{s:2:"ID";s:4:"1715";s:10:"post_title";s:24:"Python菊花文转换器";s:7:"matches";s:1:"1";s:9:"permalink";s:90:"http://azaleasays.com/2010/10/11/python-converter-for-juhuaren-html-character-entity-1161/";}i:5;a:4:{s:2:"ID";s:4:"1687";s:10:"post_title";s:40:"Python保留list只出现一次的元素";s:7:"matches";s:1:"1";s:9:"permalink";s:76:"http://azaleasays.com/2010/08/30/python-keep-list-elements-that-appear-once/";}i:6;a:4:{s:2:"ID";s:4:"1420";s:10:"post_title";s:30:"用Python漂亮地打印序列";s:7:"matches";s:1:"1";s:9:"permalink";s:72:"http://azaleasays.com/2010/07/15/print-sequence-beatifully-using-python/";}i:7;a:4:{s:2:"ID";s:4:"1407";s:10:"post_title";s:25:"在Python中调用RNAfold";s:7:"matches";s:1:"1";s:9:"permalink";s:55:"http://azaleasays.com/2010/05/19/use-rnafold-in-python/";}i:8;a:4:{s:2:"ID";s:4:"1371";s:10:"post_title";s:36:"matplotlib绘图实例2：color
    mesh";s:7:"matches";s:1:"1";s:9:"permalink";s:63:"http://azaleasays.com/2010/04/29/matplotlib-example-color-mesh/";}i:9;a:4:{s:2:"ID";s:4:"1374";s:10:"post_title";s:38:"matplotlib绘图实例1：scatter
    plot";s:7:"matches";s:1:"1";s:9:"permalink";s:65:"http://azaleasays.com/2010/04/28/matplotlib-example-scatter-plot/";}}
  _relation_threshold: '1'
  original_post_id: '1792'
---
<strong>Problem:</strong>

I wrote a python script and ran it like this:
<pre>python myscript</pre>
Worked perfectly.

Then I wanted to execute the script without explicitly calling python, so following <a href="http://effbot.org/pyfaq/how-do-i-make-a-python-script-executable-on-unix.htm">this link</a>:

1)
<pre>$ chmod +x myscript.py</pre>
2)
<pre>$ which python
/usr/bin/python</pre>
3) Add the following line in Vim:
<pre>#!/usr/bin/python</pre>
However, when I do:
<pre>./myscript
bash: ./myscript: /usr/bin/python^M: bad interpreter: No such file 
or directory</pre>
<strong>Solution:</strong>

In <a href="http://forums.devshed.com/python-programming-11/bad-interpreter-no-such-file-or-directory-379366.html">this post</a>:
<blockquote>That ^M would do the job of screwing things up. Windows uses a CRLF line ending scheme, so that ^M represents the CR from a windows newline format. Except, on Linux and *NIX systems, it's just LF. So that CR does not get translated as a newline, and instead as yet another character.</blockquote>
Following <a href="http://vim.wikia.com/wiki/File_format">this link</a>, I converted myscript from dos/unix to unix in Vim:
<blockquote>:update 	 Save any changes.
:e ++ff=dos 	Edit file again, using dos file format ('fileformats' is ignored).
:setlocal ff=unix 	This buffer will use LF-only line endings when written.
:w 	Write buffer using unix (LF-only) line endings.</blockquote>
Problem solved!
