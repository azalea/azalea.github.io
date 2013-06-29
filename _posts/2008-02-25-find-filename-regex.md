---
layout: post
title: Linux查找与特定正则表达式匹配的文件名
tags:
- linux
- ubuntu
- 文件
- 正则表达式
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '2287'
  _wp_old_slug: linux%e6%9f%a5%e6%89%be%e4%b8%8e%e7%89%b9%e5%ae%9a%e6%ad%a3%e5%88%99%e8%a1%a8%e8%be%be%e5%bc%8f%e5%8c%b9%e9%85%8d%e7%9a%84%e6%96%87%e4%bb%b6%e5%90%8d
---
前面转载过一篇文章介绍<a href="http://azalea.ztpala.com/?p=182" target="_blank">find和grep命令</a>，其中提到

grep命令可以用来查找文件中的特定内容，

find <em>path</em> -name <em>pattern</em>可以用来查找特定的文件名，但是只能用shell里的通配符匹配，包括*,?和[]

但是通配符能够匹配的模式有限。

研究了半天，终于找到了查找匹配特定正则表达式的文件名的命令:

<font color="#3366ff">find <em>path</em> -regex "<em>regularexpression</em>"</font>

man find对-regex的定义是

-regex pattern
File name matches regular expression pattern.  This is  a  match
on  the  whole path, not a search.  For example, to match a file
named ‘./fubar3’, you can use the regular expression ‘.*bar.’ or
‘.*b.*3’,  but  not ‘f.*r3’.  The regular expressions understood
by find are by default Emacs Regular Expressions, but  this  can
be changed with the -regextype option.

比如：我要查找当前目录中长成这样的文件名: 以ath-MIR开头，后面接3个数字再接0或1个小写字母,e.g. ath-MIR165a

命令如下：

find . -regex "./ath.MIR[0-9][0-9][0-9][a-z]?"

有几点注意：

a.匹配的是完整路径，即包括./

b.-regex默认的正则表达式类型是emacs，而emacs正则表达式的语法中没有{}，这在有些正则表达式中表示重复次数，如python。因此匹配3个数字只好写成[0-9][0-9][0-9]。而且emacs正则表达式好像也没有d来匹配数字，因此用[0-9]表示。

c.-regex的正则表达式类型可以用-regextype修改。除了默认的emacs类型外，还有 posix-awk,posix-basic, posix-egrep 和posix-extended. emacs正则表达式的语法<a href="http://www.cs.utah.edu/dept/old/texinfo/emacs18/emacs_17.html#SEC74" target="_blank">在这里</a>可以找到。

d.我要匹配的文件名中有-，不知道为什么不能直接写在正则表达式中， "./ath<font color="#ff0000">-</font>MIR[0-9][0-9][0-9][a-z]?"找不到匹配结果。高人请留言指教下！
