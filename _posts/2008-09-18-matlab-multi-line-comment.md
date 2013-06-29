---
layout: post
title: matlab多行注释的三种方法
tags:
- matlab
- programming
- 多行注释
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '5179'
  ratings_score: '2'
  ratings_users: '2'
  ratings_average: '1'
---
<strong>A.</strong>

<span style="color:#2c86a9;">%{</span>

若干语句

<span style="color:#2c86a9;">%}</span>

<strong>B.</strong>

多行注释: 选中要注释的若干语句, 编辑器菜单Text-&gt;Comment, 或者快捷键<span style="color:#2c86a9;">Ctrl+R</span>

取消注释: 选中要取消注释的语句, 编辑器菜单Text-&gt;Uncomment, 或者快捷键<span style="color:#2c86a9;">Ctrl+T</span>

<strong>C.</strong>

<span style="color:#2c86a9;">if LOGICAL(0)</span>

若干语句

<span style="color:#2c86a9;">end</span>

这个方法实际上是通过逻辑判断语句不执行相关的语句

参考: <a href="http://icictech.blog.163.com/blog/static/2797425420084595725499/" target="_blank">http://icictech.blog.163.com/blog/static/2797425420084595725499/</a>(原文实在太罗嗦了..)
