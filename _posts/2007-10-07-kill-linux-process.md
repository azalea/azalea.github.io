---
layout: post
title: 查找并杀死linux进程 转载
tags:
- linux
- ubuntu
- 进程
status: publish
type: post
published: true
meta:
  views: '569'
  _wp_old_slug: '%e6%9f%a5%e6%89%be%e5%b9%b6%e6%9d%80%e6%ad%bblinux%e8%bf%9b%e7%a8%8b-%e8%bd%ac%e8%bd%bd'
---
<a href="http://blog.guoshuang.com/showlog.asp?cat_id=40&amp;log_id=4013" target="_blank">原文在这里</a>ps aux | grep keyword</p>
ps 显示进程
ps aux 显示完整进程
| 管道命令，将前一个命令的结果进行进一步处理
grep Search for PATTERN in each FILE or standard input.查找相关文字

得到 keyword 的 PID

kill xxxx

xxxx 就是显示的 PID
