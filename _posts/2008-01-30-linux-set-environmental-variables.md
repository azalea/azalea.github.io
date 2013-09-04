---
layout: post
title: Linux下如何设置环境变量
tags:
- linux
- ubuntu
- 环境变量
status: publish
type: post
published: true
meta:
  views: '1189'
  _wp_old_slug: linux%e4%b8%8b%e5%a6%82%e4%bd%95%e8%ae%be%e7%bd%ae%e7%8e%af%e5%a2%83%e5%8f%98%e9%87%8f
---
<strong>1 确定shell类型</strong>

<font color="#3366ff">echo $SHELL</font>

p.s.Ubuntu默认的是bash

<strong>2 使用对应shell下的命令</strong>

Bourne Shells
<code>sh:</code>

<code>    </code><font color="#3366ff"><span class="example">VARNAME="value"; export VARNAME</span></font>

<code>ksh</code>/<code>bash</code>
<font color="#3366ff">    <span class="example">export VARNAME="value"</span></font>

C Shells

<code>csh</code>/<code>tcsh</code>

<font color="#3366ff"><span class="example">    setenv VARNAME "value"</span></font>