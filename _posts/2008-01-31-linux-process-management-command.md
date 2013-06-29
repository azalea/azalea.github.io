---
layout: post
title: linux常用进程管理命令
tags:
- linux
- ubuntu
- 进程
status: publish
type: post
published: true
meta:
  views: '811'
  _wp_old_slug: linux%e5%b8%b8%e7%94%a8%e8%bf%9b%e7%a8%8b%e7%ae%a1%e7%90%86%e5%91%bd%e4%bb%a4
---
<font color="#3366ff"><strong>ps</strong></font> 查看正在运行的程序

选项

-A 或 -e 显示所有进程

-l 长格式显示，可查看各个进程的优先权值

-u 显示指定用户的进程，比如 ps -u azalea

<strong><font color="#3366ff">kill</font></strong> PID 终止进程

note: 终止前台进程是Ctrl+C  暂停前台进程是Ctrl+Z

<strong><font color="#3366ff">&amp;</font></strong> 使进程在后台运行

<font color="#3366ff">python helloworld.py &amp;</font>

<font color="#3366ff"><strong>bg</strong></font> 把前台进程转移到后台

Ctrl+Z

<font color="#3366ff">bg 1</font>

<strong><font color="#3366ff">fg</font></strong> 把后台进程转移到前台

<font color="#3366ff">fg PID </font>
