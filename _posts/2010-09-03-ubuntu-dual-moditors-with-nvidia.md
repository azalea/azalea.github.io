---
layout: post
title: Ubuntu + Nvidia显卡实现双显示器
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  email_notification: '1283556040'
  jabber_published: '1283556039'
  _edit_last: '1'
---
1. 要确认正确安装了 Nvidia显卡驱动：
System -&gt; Administration -&gt; Hardware Drivers
选择 NVIDIA accelerated graphics driver (version 173)，确认 "This driver is activated and currently in use"，不要选择 version 180，我之前用那个驱动一直crash，经过3小时研究仍然原因不明。

2. 查看 System -&gt; Administration -&gt; Nvidia X Server Settings，默认应该有这个程序，如果没有的话，
sudo apt-get install nvidia-settings

3. 进入 Nvidia X Server Settings
sudo nvidia-settings
不能从系统菜单进入，因为那样没有权限修改配置文件。

4. 选择 X Server Display Configuration 页面，会看到1个或2个灰色的方块，这表示系统检测到的显示器。如果只有1个方块，点击 Detect Displays ，会出现第2个方块。选中那个写着 "disabled" 的方块，然后点击 Configure... ，选择 TwinView 并确认。然后拖动2个灰色方块，直到他们的位置和实际的显示器位置一致。点击 Apply。然后屏幕会闪几秒钟，然后应该在双显示器上都能看到图像了。

5. 备份原先的配置文件: sudo cp /etc/X11/xorg.conf /etc/X11/xorg.conf.backup
然后回到 Nvidia X Server Settings 程序，点击 Save to X Configuration File，保存，退出。

6. 下面重新启动X windows，看看效果吧
方法A: 使用快捷键 Ctrl + Alt + Backspace （如果已经<a href="https://wiki.ubuntu.com/KarmicKoala/ReleaseNotes#Enabling%20Ctrl-Alt-Backspace%20for%20Ubuntu">激活</a>）
方法B: Ctrl + Alt + F1，进入字符界面，然后重启GNOME Display Manager
sudo /etc/init.d/gdm stop
sudo /etc/init.d/gdm start
方法C: 直接重启电脑也好

References:
<a href="http://www.dwasifar.com/?p=862">http://www.dwasifar.com/?p=862</a>
<a href="http://blog.chewearn.com/2008/10/08/nvidia-twinview-in-intrepid-ibex-beta/">http://blog.chewearn.com/2008/10/08/nvidia-twinview-in-intrepid-ibex-beta/</a>
