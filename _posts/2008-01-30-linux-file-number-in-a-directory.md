---
layout: post
title: linux统计文件夹中文件数目
tags:
- linux
- ubuntu
- 文件
status: publish
type: post
published: true
meta:
  views: '1486'
  _wp_old_slug: linux%e7%bb%9f%e8%ae%a1%e6%96%87%e4%bb%b6%e5%a4%b9%e4%b8%ad%e6%96%87%e4%bb%b6%e6%95%b0%e7%9b%ae
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
---
转载自<a href="http://www.koven.org/archives/323.html" target="_blank">乌秋博客</a>

<strong>第一种方法：</strong>

<font color="#3366ff">ls -l|grep "^-"|wc -l</font>

ls -l 长列表输出该目录下文件信息(注意这里的文件，不同于一般的文件，可能是目录、链接、设备文件等)。如果ls -lR|grep "^-"|wc-l则可以连子目录下的文件一起统计。

grep ^- 这里将长列表输出信息过滤一部分，只保留一般文件，如果只保留目录就是 ^d

wc -l 统计输出信息的行数，因为已经过滤得只剩一般文件了，所以统计结果就是一般文件信息的行数，又由于一行信息对应一个文件，所以也就是文件的个数。

<strong>第二种方法：</strong>

<font color="#3366ff">find ./ -type f|wc -l</font>

由于默认find会去子目录查找，如果只想查找当前目录的文件用find ./ -maxdepth 1 -type f|wc -l即可。

需要说明的是第二种方法会比第一种方法快很多，尤其是也统计子目录时。
