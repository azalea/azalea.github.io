---
layout: post
title: Mac OS X 下 Wine QQ游戏
tags:
- fun
- mac
- qqgame
- wine
---
想在 Mac OS X 玩QQ游戏怎么办？有四种办法：

1. 把Mac格了装Windows，成为合格的高富帅装逼犯。

2. 装双系统。

3. 装虚拟机（如 Virtual Box），虚拟个 Windows。

4. 安装 Wine，再用 Wine 安装运行 QQ游戏。

本文单讲第4种方法。（听起来很容易，是吧？）

-----------------------------------------------------------------------------

## 1. 安装 Wine

<a href="http://www.winehq.org/">Wine</a> 得名于 Windows emulator，它能在非Windows系统下运行 Windows 程序。因为 Wine 没有 mac 安装包，所以要么需要<a href="http://www.winehq.org/docs/wineusr-guide/installing-wine-source">自己编译</a>（听说会很痛苦），要么用以下的方法（实践证明虽然简单，但等待得很痛苦）：

#### 1.1 安装 XCode

如果是 Mac OS 10.6 以上版本，可以从 <a href="https://itunes.apple.com/us/app/xcode/id497799835">Mac App Store 直接安装 XCode</a>。更早的版本请<a href="http://www.davidbaumgold.com/tutorials/wine-mac/#part-0">参考这里</a>。

安装后运行 XCode，在菜单 XCode -> Preferences -> Downloads 标签页, 安装 Command Line Tools.

#### 1.2 安装设置 MacPorts

<a href="http://www.macports.org/">MacPorts</a> 是一个包管理器（类似于 apt-get 或者 yum），可以自动解决安装包的依赖问题。在 Installing MacPorts 页面，找到对应的 .pkg 文件（如 10.8 Mountain Lion 是<a href="https://distfiles.macports.org/MacPorts/MacPorts-2.1.3-10.8-MountainLion.pkg">这个</a>），下载后双击安装。

打开终端，输入以下命令：

    echo export PATH=/opt/local/bin:/opt/local/sbin:\$PATH$'\n'export MANPATH=/opt/local/man:\$MANPATH | sudo tee -a /etc/profile
    if [ `sysctl -n hw.cpu64bit_capable` -eq 1 ]
    then
        echo "+universal" | sudo tee -a /opt/local/etc/macports/variants.conf
    else
        echo "not 64bit capable"
    fi
    sudo xcodebuild -license

阅读上面的 xcode license 并输入 agree。关闭终端再重新打开使设置生效。以上命令的详细解释<a href="http://www.davidbaumgold.com/tutorials/wine-mac/#part-2">参考这里</a>。

#### 1.3 通过 MacPorts 安装 Wine

在终端输入：

    sudo port install wine

然后是漫长的等待（建议出去吃个饭什么的）。

## 2. 安装 winetricks

winetricks 是把 Wine 自带的开源函数库替换成 Windows 系统下原生但是闭源的函数库。使用winetricks的好处是：可以 workaround 一些 Wine 的 bug。坏处是：

1. 也许会引入更多 bug

2. Wine社区不能提供对闭源函数库的支持。

终端：

    sudo port install winetricks

## 3. 安装QQ游戏

先去<a href="http://qqgame.qq.com/">这里下载</a>2013版（早先的版本不一定能成功）。

在合适的位置创建一个文件夹，比如 /Users/azalea/qq

在终端输入：

    export WINEARCH=win32
    export WINEPREFIX=/Users/azalea/qq
    export LC_ALL=zh_CN

把第2行等号后面改成刚刚创建的文件夹路径

在终端输入：

    winetricks colorprofile fontfix fontsmooth-gray fontsmooth-rgb fontsmooth-bgr mfc40 mfc42 msxml3 msxml4 msxml6 riched20 riched30 vb6run vcrun2003 vcrun2005 vcrun2008 ie6 mdac28 cjkfonts mono210

如果终端有提示要你去某个网址下载文件，并放到指定文件夹，照做就是。

然后在终端输入：

    wine /path/to/QQGame2013_setup.exe

把以上的路径和文件名改成下载的QQ游戏安装文件的所在路径和文件名。

## 4. 替换 msvcp60.dll 文件

这一步对一部分QQ游戏不是必须，但是有一些QQ游戏运行时会报错：

    wine: Call from 0x7b82c872 to unimplemented function msvcp60.dll.??0Init@ios_base@std@@QAE@XZ, aborting

0x那个地址会不同，但是都会提示 msvcp60.dll 里缺少某个函数。

解决方法是从一个Windows系统，把 C:\WINDOWS\system32\msvcp60.dll 复制到

/Users/azalea/qq/drive_c/windows/system32，替换原有的 dll 文件。

<a href="http://www.dll-files.com/dllindex/dll-files.shtml?msvcp60">这里</a>或<a href="https://dl.dropboxusercontent.com/u/308058/blog/msvcp60.dll">这里</a>提供 msvcp60.dll 的下载（如果找不到趁手的Windows系统的话，安全后果自负）。

## 5. 创建一个 QQ游戏 Application

这步不是必须，如果愿意，可以在终端输入

    wine /Users/azalea/qq/drive_c/Program\ Files/Tencent/QQGame/QQGame.exe

但是每次这么搞很累。于是按照<a href="http://wiki.winehq.org/MacOSX/FAQs#head-f1c814a8ca500350af40d817fc3b7ffc87fd3911">这里的教程</a>：

#### 5.1 创建一个 AppleScript

打开 AppleScript Editor，位置是在 /Applications/Utilities/

输入以下代码：

    on run
    set toRun to "$WINEPREFIX/drive_c/Program Files/Tencent/QQGame/QQGame.exe"
    set toRunLocale to "zh_CN"
    set winePrefix to "$HOME/qq"
    set wineLocation to "/opt/local/bin"
    set dyldFallbackLibraryPath to "/usr/X11/lib"
    -------------------------------------------------------
    --DO NOT EDIT ANYTHING BELOW THIS LINE
    -------------------------------------------------------
    set toRunPath to do shell script "WINEPREFIX=\"" & winePrefix & "\"; TEMPVAR=\"" & toRun & "\"; echo \"${TEMPVAR%/*}\""
    set toRunFile to do shell script "WINEPREFIX=\"" & winePrefix & "\"; TEMPVAR=\"" & toRun & "\"; TEMPVAR2=\"" & toRunPath & "\"; echo \"${TEMPVAR#$TEMPVAR2/}\""
    do shell script "PATH=\"" & wineLocation & ":$PATH\"; export WINEPREFIX=\"" & winePrefix & "\"; export DYLD_FALLBACK_LIBRARY_PATH=\"" & dyldFallbackLibraryPath & "\"; cd \"" & toRunPath & "\"; export LC_ALL=\"" & toRunLocale & "\"; wine \"" & toRunFile & "\" > /dev/null 2>&1 &"
    end run

在以上文件的第4行：把 to 后面改成第3步建立的文件夹路径。

在以上文件的第5行：把 to 后面改成 Wine 所在的路径。找出此路径的方法是，终端：

    which wine

把输出的路径去掉 wine 填上去。

然后选择菜单的 File -> Save... 保存文件。

Save as：QQGame（或其他你想用的名字，比如小霸王学习机）

Where：选择 Applications

File Format：选择 Application

#### 5.2 修改 QQ游戏 图标

下载并用 Preview 打开<a href="https://dl.dropboxusercontent.com/u/308058/blog/qqgame.png">此文件</a>（一个png格式的QQ游戏图标）。Cmd + A全选，并 Cmd+C 复制。

在 Applications 文件夹，找到刚创建的QQ游戏程序，图标应该是个金属质感的东东。右击选 Get Info。选中左上角的图标，按下 Cmd + V 粘贴。

大功告成！

下面你就可以像用其他Mac程序一样使用QQ游戏了。

![](https://dl.dropboxusercontent.com/u/308058/blogimages/2013/04/Screen-Shot-2013-04-11-at-5.01.20-AM.png)

![](https://dl.dropboxusercontent.com/u/308058/blogimages/2013/04/Screen-Shot-2013-04-11-at-5.09.52-AM-1024x746.png)

***

感谢[@ztpala](https://twitter.com/ztpala)同学的翻译和技术指导。

感谢三国杀友 代号86 在百忙之中帮忙找到 msvcp60.dll 文件，以及由始至终给我动力使我得以完成这艰巨任务（我其实是想说 always keeping me motivated）。

感谢以下文章或讨论的作者们，没有你们就没有我的QQ游戏！

第1步 <a href="http://www.davidbaumgold.com/tutorials/wine-mac">http://www.davidbaumgold.com/tutorials/wine-mac</a>

第3步 <a href="http://forum.ubuntu.org.cn/viewtopic.php?f=121&amp;t=385049">http://forum.ubuntu.org.cn/viewtopic.php?f=121&amp;t=385049</a>

第5.1步 <a href="http://wiki.winehq.org/MacOSX/FAQs#head-f1c814a8ca500350af40d817fc3b7ffc87fd3911">http://wiki.winehq.org/MacOSX/FAQs#head-f1c814a8ca500350af40d817fc3b7ffc87fd3911</a>

第5.2步 <a href="http://superuser.com/questions/37811/how-can-i-change-an-application-icon-in-mac-os-x">http://superuser.com/questions/37811/how-can-i-change-an-application-icon-in-mac-os-x</a>

以及各种灵感来源：

<a href="http://wiki.winehq.org/FAQ">http://wiki.winehq.org/FAQ</a>

<a href="http://wiki.winehq.org/winecfg">http://wiki.winehq.org/winecfg</a>

<a href="http://www.winehq.org/pipermail/wine-users/2006-June/022062.html">http://www.winehq.org/pipermail/wine-users/2006-June/022062.html</a>

<a href="http://hi.baidu.com/jp_xsl/item/c2e63b67d995000ba1cf0f5c">http://hi.baidu.com/jp_xsl/item/c2e63b67d995000ba1cf0f5c</a>

<a href="http://www.iusesoft.info/play-pes2011-on-mac-via-wineskin/">http://www.iusesoft.info/play-pes2011-on-mac-via-wineskin/</a>

<a href="http://ubuntuforums.org/showthread.php?t=799987">http://ubuntuforums.org/showthread.php?t=799987</a>

<a href="http://www.winehq.org/pipermail/wine-users/2007-October/027858.html">http://www.winehq.org/pipermail/wine-users/2007-October/027858.html</a>

