---
layout: post
title: 'Linux: “Argument list too long”解决方法'
tags:
- linux
- ubuntu
- 文件
status: publish
type: post
published: true
meta:
  views: '1417'
  _wp_old_slug: linux-argument-list-too-long%e8%a7%a3%e5%86%b3%e6%96%b9%e6%b3%95
---
部分翻译自<a href="http://www.linuxjournal.com/article/6060" target="_blank">这篇文章</a>

当你试图传递太多参数给一个系统命令(ls *; cp *; rm *; cat *; etc...)时，就会出现"Argument list too long"错误。本文将提供4种解决方法，按复杂程度由低到高排列。正如<a href="http://en.wikipedia.org/wiki/Occam's_Razor" target="_blank">Occam's Razor</a>的逻辑原则所说：如果其他方面不分伯仲，简单的解决方法则最好。

<strong>方法#1: 手动把命令行参数分成较小的部分</strong>

例1
<font color="#3366ff"> mv [a-l]* ../directory2
mv [m-z]* ../directory2</font>

这是4种方法里最简单的,但是远非理想的方法。你必须有办法平均分割文件，而且对于文件数目极多的情况，需要输入N遍命令。

<strong>方法#2: 使用find命令</strong>

例2
<font color="#3366ff">find $directory -type f -name '*' -exec mv
{} $directory2/. ;</font>

方法2通过find命令筛选文件列表，把符合要求的文件传递给一系列命令。
优点是find命令有很强大的筛选功能，而且，也许是最重要的，这个方法只需要1行命令。
唯一的缺点是， 方法2需要遍历文件，因此耗时较多。

<!--more-->

<strong>方法#3: 建立函数</strong>

例3a<font color="#3366ff">
function large_mv ()
{       while read line1; do
mv directory/$line1 ../directory2
done
}
ls -1 directory/ | large_mv</font>

虽然写一个shell函数确实比较复杂，但这个方法比方法1或2更灵活，它依次处理每个文件，可以进行无数操作而只使用一个命令，如:

例3b
<font color="#3366ff">function larger_mv ()
{       while read line1; do
md5sum directory/$line1 &gt;&gt;  ~/md5sums
ls -l directory/$line1 &gt;&gt; ~/backup_list
mv directory/$line1 ../directory2
done
}
ls -1 directory/ | larger_mv</font>

例3b显示我们可以先轻松地得到文件的md5sum和备份文件列表然后移动文件

然而方法3也需要遍历每个文件，因此类似方法2,也比较耗时。根据经验，方法2要稍快一些，因此仅当需要复杂的操作时才使用方法3.

<strong>方法#4：重新编译Linux内核</strong>

最后一个方法需要2个字：谨慎，这个方法很高级，因此没有经验的linux用户最好不要尝试。此外，在永久使用前，务必在系统环境中全面测试。

方法4只需要手动增加内核中分配给命令行参数的页数。打开include/linux/binfmts.h文件，在文件起始附近位置有以下几行：

/*
* MAX_ARG_PAGES defines the number of pages allocated for   arguments
* and envelope for the new program. 32 should suffice, this gives
* a maximum env+arg of 128kB w/4KB pages!
*/
#define MAX_ARG_PAGES 32

为了增加分配格命令行参数的内存，只需要赋给MAX_ARG_PAGES一个更大的值，保存，重新编译，安装，重启，搞定

在我的系统中，我把MAX_ARG_PAGES的值增加到64,就解决了所有问题。在改变这个值后，我还没有遇到任何问题。这是可以理解的，当MAX_ARG_PAGES被改为64,最长的参数行仅占用256KB系统内存--对于现在的硬件标准不算什么。

方法4的优点很明显，现在你只要像通常一样运行命令。缺点也很明显,如果分配给命令行的内存大于可用的系统内存，可能导致对系统自身的拒绝服务攻击(<a href="http://en.wikipedia.org/wiki/Denial-of-service_attack" target="_blank">DoS attack</a>)，引起系统崩溃。尤其是对于多用户系统，即使增加很小的内存分配都会有很大影响，因为每个用户都被分配到额外内存。因此一定要充分测试来决定是否你的系统可以使用方法4.
