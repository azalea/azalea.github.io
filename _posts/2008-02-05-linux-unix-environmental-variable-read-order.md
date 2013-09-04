---
layout: post
title: Linux, Unix中Bash环境变量的设定顺序 zz
tags:
- linux
- ubuntu
- 环境变量
status: publish
type: post
published: true
meta:
  views: '964'
  _wp_old_slug: linux-unix%e4%b8%adbash%e7%8e%af%e5%a2%83%e5%8f%98%e9%87%8f%e7%9a%84%e8%ae%be%e5%ae%9a%e9%a1%ba%e5%ba%8f-zz
---
转载自<a href="http://xenyinzen.wikidot.com/reship:080123-5" target="_blank">这里</a>

和Bash的环境设定有关的文件有
/etc/profile (主要)
$HOME/.bash_profile (主要)
$HOME/.bash_login
$HOME/.profile
$HOME/.bash_logout (主要)
$HOME/.bashrc (主要)
/etc/bashrc

说明如下：
<ul><li>登入(login)时</li>
</ul><ol><li>先执行 /etc/profile</li>
	<li>接着bash会检查使用者的自家目录中，是否有 .bash_profile 或者 .bash_login或者 .profile，若有，则会执行其中一个，执行顺序为：</li>
	<li>.bash_profile 最优先</li>
	<li>.bash_login其次</li>
	<li>.profile 最后</li>
</ol>
这三个档案只有在登入时，才会被bash读取

<!--more-->
<ul><li>登出(exit/logout)时</li>
</ul>
bash会检查使用者自家目录中是否有 .bash_logout，若有，则bash会执行其中的指令
<ul><li>登入后启动一个新的 shell :</li>
</ul>
此时我们称之为一个 subshell, 也就是说在命令列中键入 bash, 除了原先登入时的bash之外, 又另外启动了一个新的 bash shell.
bash 会检查使用者的自家目录中是否有 .bashrc，若有则予以执行
<ul><li>测试:</li>
</ul>
在各档中加入 echo 指令, 以观察其执行顺序.

各文件用途说明
<ul><li>/etc/profile 由 root 所控制, 用来设定适合全体使用者的shell环境</li>
	<li>若使用者自己觉得 /etc/profile 的设定, 并不合意, 可以修改自家目录中的 .bash_profile</li>
	<li>既然有了 .bash_profile, 为何要有 .bash_login 及 .profile ?这是因为有些人可能是从 Bourne shell 移转过来的, 那么, 只要将 Bourne shell 主要的起动档 .profile 移到自家目录中, 放弃使用 .bash_profile 及 .bash_login 即可继续沿用以前的设定环境</li>
	<li>.bash_login 存在理由或许和 c shell 有关, 但因为 bash 和 c shell 二者语法并不完全相容, 因此, 并不建议将 c shell 的启动档直接移过来使用.</li>
	<li>.bashrc 则是用来设定 subshell 的环境的, 之所以要有这个 .bashrc 是为免 subshell产生时, 又重覆将 /etc/profile 执行一次. 我们发现 .bashrc 中已预先会去执行 /etc/bashrc的指令, 这表示, 或许 root 会将产生 subshell 时的环境设好了,使用者只要沿用 /etc/bashrc的内容, 应该不会有任何问题.</li>
	<li>.bash_logout 是使用者登出主机之前, 会去执行的设定档, 如果使用者希望在他登出系统之后, 能帮他自动处理一些琐事, 比如: 清除临时文件, 清除屏幕等, 可以在这个档案中加以设定.</li>
</ul>