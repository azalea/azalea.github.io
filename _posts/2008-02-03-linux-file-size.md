---
layout: post
title: Linux查看文件夹大小
tags:
- linux
- ubuntu
- 文件
status: publish
type: post
published: true
meta:
  views: '3149'
  _wp_old_slug: linux%e6%9f%a5%e7%9c%8b%e6%96%87%e4%bb%b6%e5%a4%b9%e5%a4%a7%e5%b0%8f
---
du -sh 查看当前文件夹大小

du -sh * | sort -n 统计当前文件夹(目录)大小，并按文件大小排序

附送:

du -sk filename 查看指定文件大小
