---
layout: post
title: 自己动手搭建VPN
tags:
- network
- ubuntu
- VPN
status: publish
type: post
published: true
meta:
  _searchme: '1'
  _edit_last: '1'
  original_post_id: '1828'
  _wp_old_slug: '1828'
---
由于下个月要到天朝，于是未雨绸缪有备无患，准备利用实验室的server搭建个VPN。

以下仅针对 Ubuntu server。

0. 连接到server

1. 安装pptpd，这是个VPN服务器端软件

sudo apt-get install pptpd

2. 修改文件 /etc/pptpd.conf

sudo vi /etc/pptpd.conf

找到# TAG: localip一行，在后面添加以下2行：

localip 192.168.0.1

remoteip 192.168.0.234-238,192.168.0.245

3. 修改文件 /etc/ppp/pptpd-options

sudo vi /etc/ppp/pptpd-options

找到 #ms-dns这行，去掉前面的#号，修改成google提供的DNS server或其他DNS：

ms-dns 8.8.8.8

ms-dns 8.8.4.4

4. 修改文件 /etc/ppp/chap-secrets，按一行四列添加账号、服务器名、密码和IP限制。服务器名（默认 写pptpd 即可，务必与 pptpd-options 文件的name一行一样）。如创建一个名为user，密码为userpasswd，不限制登录IP的VPN账号：

user    pptpd    userpasswd    *

5. 修改文件 /etc/sysctl.conf，去掉这一行 #net.ipv4.ip_forward=1  的#号，开启ipv4  forward，然后运行命令：

sudo sysctl –p

运行后会显示 net.ipv4.ip_forward =  1，就表示修改生效了。

6. 使用iptables建立一个NAT

sudo apt-get install iptables

iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE

上面的24表示子网掩码，代表24个1.

eth0是网卡名字，可以通过命令 ifconfig 查看 （插播悲剧：server的是eth1，我写的eth0，搞了很久client都不能通过VPN server连到外网，原因竟然是这个）

为防止重启服务器后iptables丢失，先运行

iptables-save &gt; /etc/iptables-rules

然后修改文件 /etc/network/interfaces ，在eth0/eth1.. 下面加入

pre-up iptables-restore &lt; /etc/iptables-rules

7. 现在应该就搞定了。

不放心的话可以重启 server，或者重启 pptpd

sudo /etc/init.d/pptpd restart

8. 在client端设置连接VPN进行测试，client是Ubuntu的话请看<a href="https://www.vpncup.com/config/ubuntu" target="_blank">这里</a>

8.1 测试是否可以连接到VPN server：

ping server_IP

不能的话，问题应该出在前4步。

8.2 测试是否可以连接到外网：

ping 8.8.8.8 （任何其他外网IP都行）

不能的话，问题应该出在第5-6步，看看是否正确设置了 ipv4 forward

8.3 测试是否可以解析DNS：

nslookup google.com

不能的话，应该是服务器端的DNS设置有问题。

如果以上都没有问题，恭喜～～

有问题的话，抬头是google



参考文献：

pptpd配置：

<a href="http://www.wincold.com/archives/46.html#" target="_blank">http://www.wincold.com/archives/46.html#</a>

<a href="http://poptop.sourceforge.net/dox/debian-howto.phtml" target="_blank">http://poptop.sourceforge.net/dox/debian-howto.phtml</a>

连接VPN:

<a href="https://www.vpncup.com/config/ubuntu" target="_blank">https://www.vpncup.com/config/ubuntu</a>

<a href="http://ubuntuforums.org/showthread.php?t=1451996" target="_blank">http://ubuntuforums.org/showthread.php?t=1451996</a>