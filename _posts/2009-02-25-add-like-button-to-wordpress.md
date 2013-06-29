---
layout: post
title: Wordpress添加like按钮
tags:
- internet
- plugin
- wordpress
- 插件
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '477'
  ratings_users: '12'
  ratings_score: '12'
  ratings_average: '1'
---
一直超级喜欢<a href="https://friendfeed.com" target="_blank">friendfeed</a>的<a href="https://friendfeed.com/azalea/discussion" target="_blank">like</a>功能，尤其是在friendfeed之外看到一篇好文，但除了“赞”，“写得好”之外想不出其他的评论时，超级希望能有like按钮让我点一下。于是打算在自己blog加上，那些看帖不回的，点下鼠标总不会太辛苦吧。。

找了很久，虽然发现有个叫<a href="http://wordpress.org/extend/plugins/post-like-counter/" target="_blank">Post Like Counter</a>的东东，但是我不会用。<a href="http://twitter.com/ztpala" target="_blank">pala</a>提议说这个功能其实和打分差不多，于是找了著名的GamerZ写的插件<a href="http://lesterchan.net/wordpress/readme/wp-postratings.html" target="_blank">WP-PostRatings</a>。同样是下载上传激活插件，然后就是辛苦的改造工作。

1. 下载<a href="http://dl.getdropbox.com/u/308058/blog/smile.zip" target="_blank">此文件</a>(是盗版friendfeed的like图标来的- -)，上传解压后的文件夹到wp-postratings/images文件夹。

2. 在WP后台plugin-editor里修改wp-postratings.php文件，把这句define('RATINGS_IMG_EXT', 'gif');注释掉，把下一句的注释去掉。这是因为上一步提供的图标是png格式的，如果你先转换成gif，这步就不需要了。

3. 如果是WP2.7，在后台左侧你能看到一个黄色星标，是这个插件的管理界面。首先要设置Rating Options。Ratings Image选择smile, Max Ratings填1,Rating Text改成"表示喜欢“或”Like“或随便什么。AJAX Style我都选了Yes，感觉没啥区别。Allow to Rate随意，我选了注册用户和访客。Logging Method也随意，我选了Cookies+IP，就是系统认为的同一个用户只能喜欢一次。

4. 然后设置Rating Templates，我前4个分别设置的是：

%RATINGS_IMAGES_VOTE% (&lt;strong&gt;%RATINGS_USERS%&lt;/strong&gt;人喜欢)

%RATINGS_IMAGES%  (&lt;strong&gt;%RATINGS_USERS%&lt;/strong&gt;人喜欢）

%RATINGS_IMAGES%  (&lt;strong&gt;%RATINGS_USERS%&lt;/strong&gt;人喜欢）

%RATINGS_IMAGES_VOTE% (还没人喜欢）

5. 在Theme Editor里编辑index.php和single.php，在适当的地方加上：

&lt;?php if(function_exists('the_ratings')) { the_ratings(); } ?&gt;

6. 现在基本算是大功告成了。我把$post_ratings_alt_text 的值设为空了，不然鼠标移到笑脸上时会显示一堆话，当然你也可以把这堆话改了。

7. 未解决的问题：我不知道怎么能告诉别人他已经点过了啊，现在的情况是，第一次可以点，之后点就没反应了，但是显示没任何区别。

忙了一晚上，发现真是折腾啊，还不如自己写个插件呢，这么改真是把WP-PostRatings大材小用了。。
