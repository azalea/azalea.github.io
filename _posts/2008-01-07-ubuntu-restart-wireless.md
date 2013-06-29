---
layout: post
title: Ubuntu 重启无线网卡
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  views: '898'
  _wp_old_slug: ubuntu-%e9%87%8d%e5%90%af%e6%97%a0%e7%ba%bf%e7%bd%91%e5%8d%a1
---
sudo rmmod iwl4965

sudo modprobe iwl4965

notice: iwl4965是无线网卡驱动
