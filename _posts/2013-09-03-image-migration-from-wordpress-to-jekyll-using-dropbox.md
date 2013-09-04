---
layout: post
title: 用 Dropbox 解决从 Wordpress 搬家到 Jekyll 的图片存储问题
categories: 
tags:
  - jekyll 
  - wordpress
  - dropbox
  - blog
  
---
 前些日子把 blog 从 Wordpress 转到了 [Jekyll](http://ztpala.com/2011/09/12/jekyll-and-github-pages/)，但是遗留问题就是图片都是保存在搭建 Wordpress 时租租用的空间，等空间到期就访问不了了。图片搬家的解决方法主要有：
 
 1. 直接放到 Jekyll 下的文件夹，缺点是如果托管到 github，这个 project 里面会有大量图片，别人 fork 或下载很不方便。
 2. 放到 flickr，Google plus 等地，缺点是每张图片的链接都要单独查找。
 3. 放到 Dropbox 的 Public 文件夹。优点是链接统一，方便管理和以后的搬家备份。
 
 于是写了段 Python 代码，实现方法3，即搬运图片到 Dropbox，并更新 md 文件里的图片链接。Github project [在此](https://github.com/azalea/wp_img_mover)，使用方法参见 [README](https://github.com/azalea/wp_img_mover/blob/master/README.md)。
 
 
