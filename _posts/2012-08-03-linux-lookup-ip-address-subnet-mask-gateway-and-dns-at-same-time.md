---
layout: post
title: 'Linux: lookup ip address, subnet mask, gateway, and dns at same time'
tags:
- linux
- ubuntu
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  _oembed_82287685bb1a4c6828a59fa76d528d10: '{{unknown}}'
  _oembed_5c5f108b571107e8e37595b567257c68: '{{unknown}}'
---
ifconfig eth0 | grep "inet addr" ; route -n | grep UG ; grep nameserver /etc/resolv.conf

听说gnome下有个NetworkManager Applet，拖到panel上可以直接看。但是用server的人伤不起啊。。

Reference:

http://ubuntuforums.org/showthread.php?t=1687109
