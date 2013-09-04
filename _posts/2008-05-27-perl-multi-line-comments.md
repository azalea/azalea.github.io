---
layout: post
title: Perl多行注释
tags:
- perl
- programming
- 多行注释
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '3153'
  _wp_old_slug: multi-line-comments
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
---
今天才知道perl是没有多行注释的，就是类似Java里/* ... */的东东，不过可以用以下方法代替：

（来源：<a href="http://www.blogjava.net/alwayscy/archive/2007/05/24/119736.html" target="_blank">http://www.blogjava.net/alwayscy/archive/2007/05/24/119736.html</a>)

<span style="color:#3366ff;">=pod</span>
代码行;
.
.
.
代码行;
<span style="color:#3366ff;"> =cut</span>

注意: =cut 后面不能有其他字符，包括空格

这里有更多perl多行注释实现方法（英文）：

<a href="http://www.perl.com/lpt/a/663" target="_blank">http://www.perl.com/lpt/a/663</a>