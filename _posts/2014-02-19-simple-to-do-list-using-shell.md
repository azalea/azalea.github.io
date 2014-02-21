---
layout: post
title: 极简待办事项列表
categories: 
tags:
  - zsh
  - productivity
    
---
现在时间管理软件那么多，但是还有谁像我一样喜欢把待办事项写在纸上，做完直接划去的？什么？没有，那出门右转不送。如果你现在还没有出门，你一定是像我一样懒到懒得出门，那么恭喜你，你将会听到一个简单至极的方法来管理待办事项列表，高大上的说法就是 To-do list。以上废话。

这个方法非常简单，就是用文件名记录待办事项，那么文件夹就是待办事项列表。比如，你在 Dropbox 下创建 Apps/Touch To Do 文件夹，然后新建文件，文件名是“感谢本文作者”，你就创建好了新的待办事项，当你做完“感谢本文作者”这件事之后，只需要删除这个文件即可。把文件夹放在 Dropbox 下的好处，是这个待办事件列表是瞬间同步到多个设备的，因此你可以在电脑上创建名为“买炸鸡和啤酒”的事项，拿着手机出门去买。什么？你才不要出门？好吧，炸鸡和啤酒的吸引力还不够么？那继续往下看。

问一：可是我不知道怎么新建文件啊！
答一：那你一定是用 Mac 的高富帅了。Finder 竟然没有像 Windows 一样的右击“新建文本文件”菜单，真是令人发指啊。不必担心，因为我们有神器 touch。只需要 Command + Space 呼唤出 Spotlight，然后输入 Terminal 呼唤出终端，再然后输入 `touch 我要吃番茄炒蛋`，你就成功的创建好待办事项了。不过，这个文件是在你的 home 文件夹，要进入待办事项列表文件夹，需要输入 `cd ~/Dropbox/Apps/Touch\ To\ Do`,`cd`后面可以是任何你想用来放待办事项列表的文件夹。查看待办事项列表呢只需要输入`ls`，删除事项，输入`rm 我要吃番茄炒蛋`就可以了。如果你看得云里雾里，我也没办法了，其实以上都是 Unix/Linux 命令，因为 Mac OS X是基于 Unix 的。你可以搜索[Linux常用命令](https://www.google.com/search?q=Linux常用命令)试试看。

问二：可是这么新建文件还是好麻烦啊！要先`cd`到待办事项文件夹，再`touch`才可以创建啊。
答二：一劳永逸的方法：终端输入`nano ~/.bashrc`，在文件里输入：
`td() {touch ~/Dropbox/Apps/Touch\ To\ Do/"$*"}`
Ctrl+X退出，nano会问你是否要保存，输入Y。
然后终端输入`source ~/.bashrc`。
此时不管你在什么目录下输入 `td 我要吃番茄炒蛋`，都会在 Dropbox/Apps/Touch To Do 文件夹创建事项啦。

问三：问二的方法一次只能创建一个事项啊，怎么同时创建许多个呢？我又要买番茄，又要买蛋，什么？还要买炒菜锅？
答三：如此显然的答案，你可以 `td 买番茄`，`td 买蛋`，`td 买锅`嘛。或者，你可以拜访下我的 github 下的[这个文件](https://github.com/azalea/dotfiles/blob/master/zsh/aliases.zsh)，研究一下，你就知道啦。

问四：可是我是 Windows 系统啊！完全不知道你在说什么啊！
答四：快去买 Mac 吧亲。或者，格了装 Linux 吧。再或者，你可以钻研一下 [Cygwin](http://www.cygwin.com/)。

问五：为什么待办事项文件夹要叫做 Touch To Do 啊？又臭又长还有空格啊！
答五：哈，终于有人问这个问题了（其实是我自问自答自卖自夸啦），这其实是 [@ztpala](https://twitter.com/ztpala)同学写的 [iOS app](https://itunes.apple.com/us/app/id731295625?mt=8) 啦，使用这个 app，妈妈再也不用担心你忘记买锅了。