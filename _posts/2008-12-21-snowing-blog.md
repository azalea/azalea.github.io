---
layout: post
title: 下雪的blog
tags:
- blog
- 插件
- 雪
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '539'
---
冬天到了，昨天冬至也忘记了吃饺子，不过冬天的好处就是下雪，总是很好玩的。于是刚刚看到了这个东东：

<a href="http://www.schillmania.com/projects/snowstorm/" target="_blank">Snowstorm: A Javascript Snow Effect for HTML</a>

通过添加一个Javascript，让暴风雪来到你的blog, 来得更猛烈些吧！

方法：

下载<a href="http://www.schillmania.com/projects/snowstorm/snowstormv13_20081215.zip">SnowStorm v1.3.20081215</a>

解压后把image文件夹和script文件夹传到wordpress根目录

在WP后台theme-editor里，在header.php的&lt;/head&gt;标签之前加上：

&lt;<span class="start-tag">script</span><span class="attribute-name"> type</span>=<span class="attribute-value">"text/javascript" </span><span class="attribute-name">src</span>=<span class="attribute-value">"script/snowstorm.js"</span>&gt;&lt;/<span class="end-tag">script</span>&gt;

搞定，enjoy!

有很多参数可以设置（在<span class="attribute-value">snowstorm.js</span>里改），比如雪花大小，雪花多少，是否在页面底端积雪，风向是否随鼠标位置改变等等，具体请<a href="http://www.schillmania.com/projects/snowstorm/" target="_blank">自行研究</a>。。

刚知道<a href="http://www.awflasher.com/blog/archives/1616" target="_blank">可以直接用wordpress.com的js文件</a>，这样就不用上传一堆文件到自己的服务器了。

Happy Winter! Happy <span id=":23m" dir="ltr">Solstice!</span>