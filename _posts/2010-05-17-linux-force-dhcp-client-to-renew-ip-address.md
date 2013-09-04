---
layout: post
title: Linux Force DHCP client (dhclient) to renew ip address
tags:
- DHCP
- linux
- ubuntu
status: publish
type: post
published: true
meta:
  _searchme: '1'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
  views: '198'
  _wp_old_slug: linux-force-dhcp-client-dhclient-to-renew-ip-address
---
<a href="http://www.cyberciti.biz/faq/howto-linux-renew-dhcp-client-ip-address/" target="_blank">copy and paste via</a>

The -r flag explicitly releases the current lease, and once the lease has been released, the client exits. For example, open terminal and type the command:

```bash
sudo dhclient -r
```
Now obtain fresh IP:
```bash
sudo dhclient
```

There is no need to restart network service. Above command should work with any Linux distro such as RHEL, Fedora, CentOS, Ubuntu and others. On a related note you can also try out the following commands:

```bash
ifdown eth0
ifup eth0
/etc/init.d/network restart
```

or
```bash
/etc/init.d/networking restart
```
