---
layout: post
title: Python sort
tags:
- whatever
status: draft
type: post
published: false
meta:
  _edit_last: '1'
  original_post_id: '1888'
  _wp_old_slug: '1888'
---
def qsort(list):
if len(list)&lt;=1: return list
return qsort([lt for lt in list[1:] if lt&lt;list[0]]) + list[0:1] + qsort([ge for ge in list[1:] if ge&gt;=list[0]])

qsort([1,5,3,2,3,4,6,8,3])

[1, 2, 3, 3, 3, 4, 5, 6, 8] 
