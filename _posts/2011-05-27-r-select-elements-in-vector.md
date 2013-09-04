---
layout: post
title: 'R: select elements in vector'
tags:
- R
status: publish
type: post
published: true
meta:
  _searchme: '1'
  _edit_last: '1'
  original_post_id: '1830'
  _wp_old_slug: '1830'
---
x &lt;- rep(1:13, 13)
y &lt;- 1:3

选择x里和y任意元素相等的元素：
x[x==y[1] | x==y[2] | x==y[3]]

但是如果y很长的话，就悲剧了。其实可以：
x[x %in% y]

无意中搜到的，很帅呀。<a href="https://stat.ethz.ch/pipermail/r-help/2008-March/157181.html">来源</a>