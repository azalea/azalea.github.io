---
layout: post
title: config vpnc in Ubuntu
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  views: '614'
---

    $ sudo apt-get install vpnc

    $ sudo vim /etc/vpnc/example.conf

    IPSec gateway ***
    IPSec ID ***
    IPSec secret ***
    Xauth username ***

gateway就是你要链接的地址 如：mobility.up.psu.edu(wireless) vpn.aset.psu.edu(wired)

ID就是Group name 如:pennstate(wireless) psuconnect(wired)

secret就是Group password 如:pennstate(wireless) psuconnect(wired)

Xauth username 即个人用户名

保存退出

    $ sudo vpnc example.conf

输入密码 等待连接即可

---
Background Information:

<a href="http://en.wikipedia.org/wiki/Vpn" target="_blank">virtual private network (VPN)</a>
<strong>
virtual private network</strong> (<strong>VPN</strong>) is a <a href="http://en.wikipedia.org/wiki/Communications_network" title="Communications network">communications network</a> <a href="http://en.wikipedia.org/wiki/Tunneling_protocol" title="Tunneling protocol">tunneled</a> through another network, and dedicated for a specific network. One common application is secure communications through the public Internet, but a VPN need not have explicit security features, such as authentication or content encryption. VPNs, for example, can be used to separate the traffic of different user communities over an underlying network with strong security features.A VPN may have best-effort performance, or may have a defined <a href="http://en.wikipedia.org/wiki/Service_Level_Agreement" title="Service Level Agreement">Service Level Agreement</a> (SLA) between the VPN customer and the VPN service provider. Generally, a VPN has a <a href="http://en.wikipedia.org/wiki/Network_topology" title="Network topology">topology</a> more complex than <a href="http://en.wikipedia.org/wiki/Network_topology#Point-to-point:" title="Network topology">point-to-point</a>. The distinguishing characteristic of VPNs are not security or performance, but that they overlay other network(s) to provide a certain functionality that is meaningful to a user community.

--from wikipedia
<strong>vpnc</strong> is a open source client for Cisco VPN
