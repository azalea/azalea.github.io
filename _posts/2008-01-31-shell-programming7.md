---
layout: post
title: Shell编程(七)—CD管理程序简介  zz
tags:
- linux
- Shell编程
- ubuntu
- zz
status: publish
type: post
published: true
meta:
  views: '678'
  _wp_old_slug: shell%e7%bc%96%e7%a8%8b%e4%b8%83-cd%e7%ae%a1%e7%90%86%e7%a8%8b%e5%ba%8f%e7%ae%80%e4%bb%8b-zz
---
<a href="http://blog.csdn.net/mylxiaoyi/archive/2006/04/16/665998.aspx"> Shell编程(七)---CD管理程序简介</a>

简单的程序.
需求
假如我们有一个扩展的CD集合.要使得我们的生活更为简单,我们设计和实现在一个管理CD的程序.用我们所学的Linux编程的知识来实现一个电子目录似乎是一个很不错的主意.
我们希望,至少最初是这样的,我们的程序可以存储基本的CD信息,例如标签,音乐种类或是艺术家.我们还希望可以保存一些跟踪信息.
我们希望可以在每一个CD项目上进行搜索,但是却不会在跟踪细节上进行搜索.
为了使得我们的程序完整,我们希望可以输入,更新,删除任何信息.

<!--more-->
设计
我 们在上面所说的三个需求---更新,搜索,显示数据---指明了我们要实现一个简单的菜单程序.所有我们要存储的内容都是文本的,而且我们在这里假设我们 的CD集合并不是很大.我们并不需要一个完整的数据库,我们只需要一些简单的文本就可以了.将信息存放在一个文本文件中可以使得我们的程序保持简单,而且 如果我们的需求发生变化,处理文本文件总是要比其他类型的文件简单得多.作为最后的一个手段,我们可以手工使用文本编辑器来输入和删除数据,而并需要编写 一个程序来完成这样的工作.
我们必须为我们的数据存储做出一个重要的设计决定:是不是单一的一个文件就足够了呢?如果是这样,那么他应是什么格式的文件呢?我们所希望存储的大多数的数据信息对于每一个CD来说只有一次,当然这样排除跟踪信息.所有的CD将会有多于一个跟踪信息.
我们是否应在我们要存储的每一个CD上设置一个数字的极限呢?这看起来是任意的和不必需的限制,所以我们立刻否决了这样的想法.
如果我们允许灵活的跟踪数目,我们有下面的三个选项:
1 使用单一的文件,使用一行来存放CD的标题类信息并使用N行来存放CD的跟踪信息.
2 将CD的所有信息放在一行,允许行继续直到没有跟踪信息需要存入为止.
3 将标题信息与跟踪信息相分离并使用另一个不同的文件进行存储.
只有第三个选项可以允许我们灵活的来修正文件的格式,如果曾经希望将我们的数据库转换为相关的格式我们可以做出这样的选择,所以在这里我们会选择第三个选项.
下一个决定就是我们要在我们的文件中存放什么内容:
最初,对于每一个CD标题,我们会选择存放:
1 CD目录标号
2 标题
3 类型
4 作曲家或艺术家
对于轨迹内容,我们会简单的存放:
1 轨迹标号
2 轨迹名字
为了能够合并这两个文件,我们必须将轨迹信息与CD的其他信息相关联.为了这样做,我们会使用CD目录编号.因为这对于每一个CD来说是唯一的,这样他就会在标题文件和轨迹文件中只出现一次.
下面让我们来看一下一个简单的标题文件的例子:
目录    标题        类型        作曲家
CD123    Cool sax    Jazz        Bix
CD234    Classic violin    Classical    Bach
CD345    Hits99        Pop        Various
他们所对应的轨迹信息如下:
目录    轨迹标号    标题
CD123    1        Some jazz
CD123    2        More jazz
CD345     1        Dizzy
CD234    1        Sonata in D minor
这两个文件使用目录域进行联合.在这里我们要记住,对于标题文件中的每一个实体在轨迹文件中会有多行与之对应.
我们要做的最后一件事就是如何来区分这些实体.在关系数据库中通常采用确定宽度的域,但是并不总是合适的.另一个常用的办法就是逗号,而这也是我们这里所采用的方法.
在我们下面的部分中,为了使得我们不至于迷惑,我们会使用下面的一些函数:
get_return()
get_confirm()
set_menu_choice()
insert_title()
insert_track()
add_record_tracks()
add_records()
find_cd()
update_cd()
count_cds()
remove_records()
list_tracks()
一个CD程序
1 在我们的例子程序中,第一行总是要保证这个程序要作为一个Shell脚本来执行,接下来的是一些版权信息:
#!/bin/sh
# Very simple example shell script for managing a CD collection.
# Copyright (C) 1996-2003 Wrox Press.
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2 of the License, or (at your
# option) any later version.
# This program is distributed in the hopes that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
# Public License for more details.
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.
# 675 Mass Ave, Cambridge, MA 02139, USA.
2 我们要做的第一件事就是保证我们在整个脚本中使用的全局变量已经进行设置.我们要设置标题文件,一个轨迹文件以及一个临时文件.我们同时要跟踪Ctrl+C操作,这样如果用户中断了脚本,我们可以保证删除临时文件.menu_choice=””
current_cd=””
title_file=”title.cdb”
tracks_file=”tracks.cdb”
temp_file=/tmp/cdb.$$
trap ‘rm -f $temp_file’ EXIT
3 现在我们要定义我们需要的一些函数,这样脚本从顶行开始执行,在我们试着第一次调用这些函数时可以找到这些函数的定义.为了避免在一些重写一些相同的代码,最初的两个函数是简单的实用程序.
get_return() {
echo -e “Press return c”
read x
return 0
}
get_confirm() {
echo -e “Are you sure? c”
while true
do
read x
case “$x” in
y | yes | Y | Yes | YES )
return 0;;
n | no | N | No | NO )
echo
echo “Cancelled”
return 1;;
*) echo “Please enter yes or no” ;;
esac
done
}
4 现在我们来定义主要的菜单函数,set_menu_choise.菜单的内容可以动态的变化,如果一个CD实体被选择可以增加一些其他的选项.
set_menu_choice() {
clear
echo “Options :-”
echo
echo “    a) Add new CD”
echo “    f) Find CD”
echo “    c) Count the CDs and tracks in the catalog”
if [ “$cdcatnum” != “” ]; then
echo “   l) List tracks on $cdtitle”
echo “   r) Remove $cdtitle”
echo “   u) Update track information for $cdtitle”
fi
echo “    q) Quit”
echo
echo -e “Please enter choice then press return c”
read menu_choice
return
}
5 现在是两个非常短小的函数,insert_title和insert_track,这样可以增加数据库文件.虽然一些讨厌这样的内容,但是他们却可以使得其他的函数看起来更为简洁.
紧随着他们的是一个较大的函数定义,add_record_track,在这其中使用前面的两个函数.这个函数使用模式匹配从而保证用户没有输入逗号(因为我们要使用逗号作为区域分隔符),并且当输入了轨迹信息后使用算村运算来增加轨迹数.
insert_title() {
echo $* &gt;&gt; $title_file
return
}
insert_track() {
echo $* &gt;&gt; $tracks_file
return
}
add_record_tracks() {
echo “Enter track information for this CD”
echo “When no more tracks enter q”
cdtrack=1
cdttitle=””
while [ “$cdttitle” != “q” ]
do
echo -e “Track $cdtrack, track title? c”
read tmp
cdttitle=${tmp%%,*}
if [ “$tmp” != “$cdttitle” ]; then
echo “Sorry, no commas allowed”
continue
fi
if [ -n “$cdttitle” ] ; then
if [ “$cdttitle” != “q” ]; then
insert_track $cdcatnum,$cdtrack,$cdttitle
fi
else
cdtrack=$((cdtrack-1))
fi
cdtrack=$((cdtrack+1))
done
}
6 add_records函数允许将一个主CD的信息实体作为一个新的CD
add_records() {
# Prompt for the initial information
echo -e “Enter catalog name c”
read tmp
cdcatnum=${tmp%%,*}
echo -e “Enter title c”
read tmp
cdtitle=${tmp%%,*}
echo -e “Enter type c”
read tmp
cdtype=${tmp%%,*}
echo -e “Enter artist/composer c”
read tmp
cdac=${tmp%%,*}
# Check that they want to enter the information
echo About to add new entry
echo “$cdcatnum $cdtitle $cdtype $cdac”
# If confirmed then append it to the titles file
if get_confirm ; then
insert_title $cdcatnum,$cdtitle,$cdtype,$cdac
add_record_tracks
else
remove_records
fi
return
}
7 find_cd函数使用grep命令在CD标题文件中查找指定的目录名字的文本.我们需要知道查找到多少次字符串,但是grep命令只会在他匹配了零次或 是多次时才返回一个值.因为这样的情况,我们在一个文件中存储这些输出,其中每一个行匹配一个,然后我们可以计算这个文件中的行数.
字数统计命令 wc,在他的输出中使用空格来分隔行数,字数以及文件中的字符数.我们使用$(wc -l $temp_file)命令来从这个命令的输出中得到第一个参数来设置linesfound变量.如果我们希望得到其他的后面的参数,我们可以使用set 命令来设置命令输出的Shell参数变量.
我们将IFS设置为逗号,这样我们就可以使用逗号来进行分隔了.另一个办法就是使用cut命令.
find_cd() {
if [ “$1” = “n” ]; then
asklist=n
else
asklist=y
fi
cdcatnum=””
echo -e “Enter a string to search for in the CD titles c”
read searchstr
if [ “$searchstr” = “” ]; then
return 0
fi
grep “$searchstr” $title_file &gt; $temp_file
set $(wc -l $temp_file)
linesfound=$l
case “$linesfound” in
0)     echo “Sorry, nothing found”
get_return
return 0
;;
1)     ;;
2)     echo “Sorry, not unique.”
echo “Found the following”
cat $temp_file
get_return
return 0
esac
IFS=”,”
read cdcatnum cdtitle cdtype cdac &lt; $temp_file
IFS=” “
if [ -z “$cdcatnum” ]; then
echo “Sorry, could not extract catalog field from $temp_file”
get_return
return 0
fi
echo
echo Catalog number: $cdcatnum
echo Title: $cdtitle
echo Type: $cdtype
echo Artist/Composer: $cdac
echo
get_return
if [ “$asklist” = “y” ]; then
echo -e “View tracks for this CD? c”
read x
if [ “$x” = “y” ]; then
echo
list_tracks
echo
fi
fi
return 1
}
8 update_cd可以允许我们重新输入一个CD的信息.在这里我们要注意的就是我们要查找(使用grep命令)以$cdcatnum开头(^)并且后跟 逗号的行,而且我们需要将$cdcatnum用{}作来一个整体,这样我们就可以在他与目录标号之间没有空格的情况下查找逗号.如果 get_confirm函数返回值为真,则这个函数同时还会使用{}括起多条语句来执行.
update_cd() {
if [ -z “$cdcatnum” ]; then
echo “You must select a CD first”
find_cd n
fi
if [ -n “$cdcatnum” ]; then
echo “Current tracks are :-”
list_tracks
echo
echo “This will re-enter the tracks for $cdtitle”
get_confirm &amp;&amp; {
grep -v “^${cdcatnum},” $tracks_file &gt; $temp_file
mv $temp_file $tracks_file
echo
add_record_tracks
}
fi
return
}
9 count_cds将会返回我们数据库内容的一个快速计数.
count_cds() {
set $(wc -l $title_file)
num_titles=$l
set $(wc -l $tracks_file)
num_tracks=$l
echo found $num_titles CDs, with a total of $num_tracks tracks
get_return
return
}
10 remove_records将断开数据库文件与实体之间的联系,使用grep -v命令来移除所有匹配的字符串.在这里我们要注意的是我们必须使用临时文件.
如果我们试着使用下面的命令:
grep -v “^$cdcatnum” &gt; $title_file
在grep命令有机会执行之前$title_file已经使用&gt;输出重定向设置为一个空文件,所以grep命令将会读取一个空文件.
remove_records() {
if [ -z “$cdcatnum” ]; then
echo You must select a CD first
find_cd n
fi
if [ -n “$cdcatnum” ]; then
echo “You are about to delete $cdtitle”
get_confirm &amp;&amp; {
grep -v “^${cdcatnum},” $title_file &gt; $temp_file
mv $temp_file $title_file
grep -v “^${cdcatnum},” $tracks_file &gt; $temp_file
mv $temp_file $tracks_file
cdcatnum=””
echo Entry removed
}
get_return
fi
return
}
11 list_tracks现一次使用grep命令来解压我们需要的行,并且截取我们所需要部分而且会提供一个已标记的输出.如果我们来考虑一下要将这些20几行的古怪代码使用C代码重新进行实现会需要多少行代码,这时我们就会体会Shell是一个多么强大的工具了.
list_tracks() {
if [ “$cdcatnum” = “” ]; then
echo no CD selected yet
return
else
grep “^${cdcatnum},” $tracks_file &gt; $temp_file
num_tracks=$(wc -l $temp_file)
if [ “$num_tracks” = “0” ]; then
echo no tracks found for $cdtitle
else {
echo
echo “$cdtitle :-”
echo
cut -f 2- -d , $temp_file
echo
} | ${PAGER:-more}
fi
fi
get_return
return
}
12 现在所有的函数都已经进行定义,我们可以进入我们的主要部分了.最初的几行可以简单的将文件读入到一个已知的状态,然后我们调用菜单函数,set_menu_choice并且反应在输出.
当选择了quit,我们删除这个临时文件,输出信息,并且已成功条件返回.
rm -f $temp_file
if [ ! -f $title_file ]; then
touch $title_file
fi
if [ ! -f $tracks_file ]; then
touch $tracks_file
fi
# Now the application proper
clear
echo
echo
echo “Mini CD manager”
sleep 1
quit=n
while [ “$quit” != “y” ];
do
set_menu_choice
case “$menu_choice” in
a) add_records;;
r)  remove_records;;
f)  find_cd y;;
u)  update_cd;;
c)  count_cds;;
l)  list_tracks;;
b)
echo
more $title_file
echo
get_return;;
q | Q ) quit=y;;
*) echo “Sorry, choice not recognized”;;
esac
done
#Tidy up and leave
rm -f $temp_file
echo “Finished”
exit 0
这样,我们就完成了我们这个简单但是实用的一个程序了~~
Trackback: http://tb.blog.csdn.net/TrackBack.aspx?PostId=665998