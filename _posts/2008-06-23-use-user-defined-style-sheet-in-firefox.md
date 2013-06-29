---
layout: post
title: Firefox下使用用户自定义的样式表
tags:
- CSS
- firefox
- internet
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '810'
---
很多网页都使用了层叠样式表(CSS)，如果你厌倦了网页设计者定义的显示样式，或者你有特殊的偏好，那么用户自定义样式表可以提升你的浏览体验。

<a href="http://www.squarefree.com/userstyles/user-style-sheets.html" target="_blank">这里</a>介绍了多种方法，可以对所有网页或特定网页使用自定义的样式表。以下步骤用于在Firefox下对所有网站使用用户自定义的样式表。
<ol>
	<li><a href="http://www.mozilla.org/support/firefox/profile#locate" target="_blank">找到Firefox的profile</a>，Linux下的默认目录是 ~/.mozilla/firefox/xxxxxxxx.default/  （xxxxxxxx是一个8位随机字符串）</li>
	<li>在chrome子目录中, 创建一个名为userContent.css的CSS文件，编辑加入所需要的样式，比如：
[css]
/* userContent.css */
*       { color: white !important;
        background-color: white !important;
        font-family: Verdana, sans-serif !important; }
body    { font-size: 24pt !important; }
a:link  { color: cyan !important; }
a:visited { color: violet !important; }
[/css]</li>
	<li>保存 userContent.css文件然后重启Firefox.</li>
</ol>
