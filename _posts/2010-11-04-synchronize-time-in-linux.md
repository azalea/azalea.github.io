---
layout: post
title: Synchronize time in Linux
tags:
- linux
- ubuntu
language: en
---
ntpdate pool.ntp.org

<a href="http://linux.die.net/man/1/ntpdate" target="_blank">ntpdate</a> sets the local date and time via <a href="http://en.wikipedia.org/wiki/Network_Time_Protocol" target="_blank">NTP</a>.

The command automatically runs at startup. But for a server which rarely reboots, you can manually run it to synchronize the local date and time.
