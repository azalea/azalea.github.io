---
layout: post
title: 娱乐：如何证明 n = O(1)
tags:
- algorithm
- fun
- programming
status: publish
type: post
published: true
meta:
  _searchme: '1'
  _edit_last: '1'
  original_post_id: '1827'
  _wp_old_slug: '1827'
---
在 <a href="http://www.youtube.com/watch?v=whjt_N9uYFI" target="_blank">MIT Introduction to Algorithms Lec 2</a> 看到：

To prove n = O(1) by induction:

Base case:

1 = O(1)

Induction step:

If n-1 = O(1),

then  n = (n-1) + 1 = O(1) + O(1) = O(1)

这样一来所有算法都是constant time了 ;)

至于上面的证明错在哪里，请移步<a href="http://www.youtube.com/watch?v=whjt_N9uYFI" target="_blank">原视频</a>22min.
