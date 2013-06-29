---
layout: post
title: ubuntu下安装phylip
tags:
- study
- ubuntu
status: publish
type: post
published: true
meta:
  views: '612'
  _wp_old_slug: ubuntu%e4%b8%8b%e5%ae%89%e8%a3%85phylip
---
先去官方网站下载 <a href="http://evolution.gs.washington.edu/phylip/download/phylip-3.67.tar.gz">gzip'ed tar archive of C sources and documentation</a>
然后解压  sudo tar zxvf phylip-3.67.tar.gz
到src目录下 sudo make install

如果提示缺少头文件,则安装 <span id="1eop">sudo apt-get install libxaw7-dev</span>
