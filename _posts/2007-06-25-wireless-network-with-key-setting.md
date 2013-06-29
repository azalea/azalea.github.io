---
layout: post
title: 有密钥的无线网络设置
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  views: '776'
  _wp_old_slug: '%e6%9c%89%e5%af%86%e9%92%a5%e7%9a%84%e6%97%a0%e9%99%90%e7%bd%91%e7%bb%9c%e8%ae%be%e7%bd%ae'
---
<span><span>sudo iwconfig eth1 essid any key "s:密码"</span></span>
sudo dhclient eth1
