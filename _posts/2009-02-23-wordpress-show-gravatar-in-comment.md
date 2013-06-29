---
layout: post
title: 在WordPress评论框显示gravatar头像
tags:
- internet
- theme
- wordpress
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '452'
  ratings_users: '2'
  ratings_score: '2'
  ratings_average: '1'
---
如果wordpress主题不默认显示Gravatar头像，想让它显示的话，只需要comments.php的适当位置加入如下代码：

<span style="color:#3366ff;">&lt;?php echo get_avatar( $comment, 32 ); ?&gt;</span>

第二个参数（这里是32）表示头像大小，可以随意更改。

实际可以很灵活，比如我用的代码：

<span style="color:#3366ff;">&lt;div&gt;
&lt;span class=”gravatar”&gt;&lt;?php echo get_avatar( $comment, 32 ); ?&gt;&lt;/span&gt;
&lt;span&gt;&lt;strong&gt;&lt;?php comment_author_link() ?&gt;&lt;/strong&gt;&lt;/span&gt;
&lt;/div&gt;</span>

然后在Theme Editor的style.css文件里加上：

<span style="color:#3366ff;">.gravatar{
border: 1px solid #999;
margin: 5px 2px 2px 4px;
padding: 4px 2px 2px 4px;
background-color: white;
}</span>

以上是为了和Wordpress Thread Comment插件的显示效果相似，于是把那个插件comment-childs的css直接拿来用了。

主要参考: <a href="http://www.liuzhenyun.com/post/wordpress-gravatar.html" target="_blank">zylew's blog</a>, 那里给出了另外一种头像的样式。
