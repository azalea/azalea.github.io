---
layout: post
title: Shell编程(五)—find与grep命令简介及正则表达式  zz
tags:
- linux
- Shell编程
- ubuntu
- zz
- 正则表达式
status: publish
type: post
published: true
meta:
  views: '904'
  _wp_old_slug: shell%e7%bc%96%e7%a8%8b%e4%ba%94-find%e4%b8%8egrep%e5%91%bd%e4%bb%a4%e7%ae%80%e4%bb%8b%e5%8f%8a%e6%ad%a3%e5%88%99%e8%a1%a8%e8%be%be%e5%bc%8f-zz
---
<a href="http://blog.csdn.net/mylxiaoyi/archive/2006/04/14/663755.aspx"> Shell编程(五)---find与grep命令简介及正则表达式</a>

<p class="postText">		两个更为有用的命令和正则表达式
在我们开始学习新的Shell编程知识之前,我们先来看一下两个更为有用的两个命令,这两个命令虽然并不是Shell的一部分,但是在进行Shell编程时却会经常用到.随后我们会来看一下正则表达式.
find命令
我们先来看的是find命令.这个命令对于我们用来查找文件时是相当有用的,但是对于Linux新手来说却有一些难于使用,在一定程序是由于他所带的选项,测试,动作类型参数,而且一个参数的执行结果会影响接下来的参数.
在我们深入这些选项和参数之前,我们先来看一个非常简单的例子.假如在我们的机子上有一个文件wish.我们来进行这个操作时要以root身份来运行,这样就可以保证我们可以搜索整个机子:

<p class="postText"><!--more-->
# find / -name wish -print
/usr/bin/wish
#
正如我们可以想到的,他会打印出搜索到的结果.很简单,是不是?
然而,他却需要一定的时间来运行,因为他也会同时搜索网络上的Window机器上的磁盘.Linux机器会挂载大块的Window机器的文件系统.他也会同时那些位置,虽然我们知道我们要查找的文件位于Linux机器上.
这也正是第一个选项的用武之地.如果我们指定了-mount选项,我们就可以告诉find命令不要搜索挂载的目录.
# find / -mount -name wish -print
/usr/bin/wish
#
这样我们仍然可以搜索这个文件,但是这一次并没有搜索挂载的文件系统.
find命令的完整语法如下:
find [path] [options] [tests] [actions]
path是一个很简单的部分:我们可以使用绝对路径,例如/bin,或者是使用相对路径,例如.. .如果我们需要我们还可以指定多个路径,例如 find /var /home
主要的一些选项如下:
-depth    在查看目录本身以前要先搜索目录中的内容
-follow    跟随符号链接
-maxdepths N    在搜索一个目录时至多搜索N层
-mount(或-xdev)    不要搜索其他的文件系统
下 面的是一些test的选项.我们可以为find命令指定大量的测试,并且每一个测试会返回真或是假.当find命令工作时,他会考查顺序查找到的文件,并 且会在这个文件上按顺序进行他们所定义的测试.如果一个测试返回假,find命令会停止他当前正在考查的文件并继续进行下面的动作.我们在下表中列出的只 是一些我们最常用到的测试,我们可以通过查看手册页得到我们可以利用find命令使用的可能的扩展列表项.
-atime N    N天以前访问的文件
-mtime N    N天以前修改的文件
-name pattern    除了路径,与指定的类型匹配的文件名.为了保证指定的类型传递给find命令而并不是立即被Shell赋值,指定的类型必须用引号进行引用.
-newer otherfile    与otherfile文件相比要新的文件
-type C        C类型的文件,而这里的C可以指定的一种类型.最常用的是d代表目录,而f是指普通的文件.对于其他的文件类型,我们可以查看手册页.
-user username    指定的用户所拥有的文件
我们也可以使用运算符进行测试的组合.大多数的有两种格式:短格式和长格式.
!    -not    测试的反
-a    -and    所有的测试必须为真
-o    -or    测试中某一个为真
我 们可以使用括号来强行改变测试和运算符的次序.因为这些对于Shell来说有着特殊的意义,所以我们也需要使用反斜线将他们作为一个整体进行引用.另外, 如果我们为文件名指定了匹配类型,我们也必须用引号进行引用,这样就可以避免他们被Shell进行扩展,从而可以将他们直接传递给find命令.所以如果 我们要写一个这样的测试,要查找比X文件要近或者是以一个范围开头的文件,我们要写成下面的形式:
(-newer X -o -name “_*” )
现在我们要试着在当前的目录下查找最近修改日期比while2更近的文件,我们可以用下面的命令:
$ find . -newer while2 -print
.
./elif3
./words.txt
./words2.txt
./_trap
$
我们在上面所用的命令看起来似乎不错,但是我们却同时也搜索了当前的目录文件,而这并不是我们所希望的,我们所感兴趣只是常规文件.所以我们可以加上另外一个测试-type f:
$ find . -newer while2 -type f -print
./elif3
./words.txt
./words2.txt
./_trap
$
工作原理:
这 些命令是如何进行工作的呢?我们指定find命令应该在当前的目录下进行查找(.),而我们所要查找的是比while2更新的文件(-newer while2),而且如果已经传递了测试,还要测试这个文件是否为一个常规文件(-type -f).最后,我们使用我们以前用过的动作,-print,仅仅是来验证我们所找到的文件.
下面我们要查找的文件或者是以下划线开头的或者是要比while2文件新的文件,但是也必须为一个常规文件.这个例子可以向我们展示如何来进行测试的组合:
$ find . ( -name “_*” -or -newer while2 ) -type f -print
./elif3
./words.txt
./words2.txt
./_break
./_if
./_set
./_shift
./_trap
./_unset
./_until
$
这时我们可以看到这并不是一件很难的事情,不是这样吗?我们必须转义圆括号,这样他就不会被Shell所保护,同时用引号引用*,这样他就可以直接传递给find命令了.
既然我们现在能够可靠的查找文件,下面我们就来看一下当我们查找指定的文件时我们可以进行的一些协作.我们要再一次强调,我们在这里所列出的只是一些最常用的选项,我们可以查看手册页得到全部的集合.
-exec command    执行一个命令.这是我们最常执行的动作.
-ok command    与-exec相类似,所不同的只是他会提示用户在执行将要执行的命令之前进行命令的确认.
-print        打印出文件名
-ls        使用ls命令列出当前的文件
-exec和-ok命令会同一行的参数子序列作为他的参数的一部分,直到遇到一个终结符;序列.对于-exec和-ok来说字符串{}是珍上特殊的类型,而且会为当前文件的绝对路径所替换.
这样的解释也许并不是太认人容易理解,但是一个例子也许可以很好的来说明这些.
如下面的一个简单的例子:
$ find . -newer while2 -type f -exec ls -l {} ;
-rwxr-xr-x    1 rick     rick          275 Feb 8 17:07 ./elif3
-rwxr-xr-x    1 rick     rick          336 Feb 8 16:52 ./words.txt
-rwxr-xr-x    1 rick     rick         1274 Feb 8 16:52 ./words2.txt
-rwxr-xr-x    1 rick     rick          504 Feb 8 18:43 ./_trap
$
正如我们现在所看到的,find命令是相当有用的.要用好这个命令只需要一些简单的练习.然而这样的练习也许要付一定的代价,所以我们应做一些find命令的实验.
grep命令
我 们将要看到的第二个非常有用的命令为grep命令,这是一个并不常见的名字,他是通用正则表达式解析器的简称(General Regular Expression Parser).我们使用find命令在我们的系统是查找所需的文件,但是我们却要使用grep命令在文件中查找指定的字符串.而事实上,最常用的做法就 是当我们在使用find命令时将grep作为一个命令传递给-exec.
grep命令可以带选项,匹配的模式以及我们要在其中查找的文件:
grep [options] PATTERN [FILES]
如果并没有指定文件名,他就会搜索标准输入.
让我们从grep命令的主要的选项开始.我们在这里列出的只是一些主要的选项,我们可以从手册中得到更为详细的内容说明.
-c    打印出匹配行的总数,而不是打印出匹配的行
-E    打开扩展表达式
-h    禁止将在其中查找到匹配内容的文件名作为输出行的前缀
-i    忽略大小写
-l    列出带用匹配行的文件名,而不是输出实际的匹配行
-v    将匹配类型转换为选择不匹配的行而不是匹配的行
如下面的一些例子:
$ grep in words.txt
When shall we three meet again. In thunder, lightning, or in rain?
I come, Graymalkin!
$ grep -c in words.txt words2.txt
words.txt:2
words2.txt:14
$ grep -c -v in words.txt words2.txt
words.txt:9
words2.txt:16
$
工作原理:
第一个例子中并没有指定选项,grep命令只是简单在的words.txt文件中查找字符串in,并且打印出所匹配的行.在这里并没有打印出文件名,这是因为在这里我们只是使用了一个文件.
在第二个例子中打印出在两个不同的中匹配行的总数,在这种情况就要打印出文件名.
在最后的一个例子中我们使用了-v选项来转换查找的条件并且打印出在两个文件中不匹配的总行数.
正则表达式
正是我们所看到的,grep命令的基本用法是比较容易掌握的.现在我们要来看一下基本的正则表达式,这会允许我们做一些更为复杂的匹配.正如我们在前面所提到的,正则表达式是用在Linux或是共他的一些开源中的语言.我们可以在vi或是在编写Perl脚本时使用.
在正则表达式的使用过程中,一些字符会被以不同的方式进行处理.最常见的一些用法如下:
^    在一行的开头
$    在一行的结尾
.    任意一个单一字符
[]    方括号中所包含是字母的范围,其中的任何一个都可以进行匹配,例如a-e的字母范围,或者是我们可以使用^来进行反义.
如果我们要将他们作为普通的字符来使用就要在这些字符前面加上.所以如果我们要查找一个$字符,我们就要使用$来进行查找.
下面的是一些可以在方括号中使用的比较有用的特殊匹配:
[:alnum:]    字母数字字符
[:alpha:]    字母
[:ascii:]    ASCII字符
[:blank:]    空格或是Tab
[:cntrl:]    ASCII码控制字符
[:digit:]    数字
[:graph:]    非控制,非空格字符
[:lower:]    小写字母
[:print:]    可打印字符
[:punct:]    标点字符
[:space:]    空白字符,包括垂直Tab
[:upper:]    大写字符
[:xdigit:]    十六进制数字
另外,如果同时使用-E选项指定了扩展匹配,在正则表达式的后面也许会跟一些其他的控制匹配类型组合的字符.如果我们只是想将他们作为普通的字符进行使用,我们也要在其前面加上转义符.
?    可选的匹配,但是最多匹配一次
*    必须匹配0个或是多个项目
+    必须匹配1个或是多个项目
{n}    必须匹配n次
{n,}    必须匹配n次或是更多次
{n,m}    匹配范围为n次到m次,包括m次
这些内容看起来有一些复杂,但是如果我们循序渐进,我们就会发现事实上这些内容并不如我们在第一眼看到时那样的复杂.最简单的掌握正则表达式的方法就是简单的试一些例子:
如果我们要查找以字符e结尾的行我们可以用下面的命令:
$ grep e$ words2.txt
Art thou not, fatal vision, sensible
I see thee yet, in form as palpable
Nature seems dead, and wicked dreams abuse
$
正如我们所看到的,这个命令会搜索出以e结尾的匹配行.
现在假设我们要查找以字母a结尾的单词.要达到这个目的,我们在方括号中使用特殊的匹配.在这样的情况下,我们要使用[[:blank:]],这会测试一个空格或是一个Tab:
$ grep a[[:blank:]] words2.txt
Is this a dagger which I see before me,
A dagger of the mind, a false creation,
Moves like a ghost. Thou sure and firm-set earth,
$
现在假设我们要查找一个以Th开头的三个字母的单词.在这种情况下,我们需要同时使用[[:space:]]来决定一个单词的结尾并使用.来匹配另外的一个字母:
$ grep Th.[[:space:]] words2.txt
The handle toward my hand? Come, let me clutch thee.
The curtain’d sleep; witchcraft celebrates
Thy very stones prate of my whereabout,
$
最后我们要使用扩展的grep命令来查找10个字符长的小写字母的单词.在这里我们要指定一个字符的范围的来匹配a到z,同时指定字符的10次重复:
$ grep -E [a-z]{10} words2.txt
Proceeding from the heat-oppressed brain?
And such an instrument I was to use.
The curtain’d sleep; witchcraft celebrates
Thy very stones prate of my whereabout,
$
我们在这里只是接触正则表达式一些相对来说更为重要的一部分.正如在Linux中的其他的大多数的内容,在这之外会许多的文档来帮助我们要发现更为详细的内容,但是学习正则表达式的最好的方法就是要实验这些表达式.
命令执行:
当 我们编写脚本时,我们常常需要在Shell脚本中取得命令执行结果的结果来使用.也就说我们需要执行一个命令并将这个命令的输出结果放在一个变量中.这时 我们可以使用我们在前面的set命令的例子中所介绍的$(command)语法.这也是一个相对较老的格式,而最常使用的用法是`command`格式.
所 有新的脚本应使用$(...)的格式,这可以用来避免一些相当复杂的在反引号命令中使用$,`,所造成的转换规则.如果在`...`结构中使用了反引 号,我们就需要使用进行转义.这些相对模糊的字符会使得程序感到迷惑,有时甚至是一些经验丰富的程序也不得不进行一些试验以使得在反引号命令中的引号可 以正确的进行工作.
$(command)命令的结果只是简单的命令的输出.在这里我们要注意的是这并不是这个命令的返回状态,而是输出的字符串.如下面的例子:
#!/bin/sh
echo The current directory is $PWD
echo The current users are $(who)
exit 0
因为当前的目录是一个Shell环境变量,所以第一行并不需要使用这种命令执行结构.然而,who命令的执行结果,如果希望他在这个脚本中可见,我们就要使用这种命令结构.
如果我们希望将他们的结果放在一个变量中,我们可以像平常一样将他们赋值给一个变量:
whoisthere=$(who)
echo $whoisthere
将 一个命令的执行结果放在一个脚本变量中的能力是相当强大的,因为这样就可以很容易的在脚本中使用现在的命令并取得他们的输出.如果你发现在你正在试着转换 一个标准命令在标准输出上的输出结果的参数集合并将他们作为一个程序的参数,你就会发现命令xargs会帮助你完成这一切.可以查看手册页得到更深更详细 的内容.
有时会出现的一个问题就是我们要调用的命令会在我们所希望的文本出现之前输出了一些空白符,或者是比我们所希望的更多的内容.在这样的情况下,我们可以使用我们在前面所说到的set命令.
算术扩展
我们已经使用了expr命令,这可以允许处理简单的算术命令,但是他的执行是相当的慢的,因为在处理expr命令时需要调用一个新的Shell.
一个新的更好的替换就是$((...))扩展.通过将我们所希望的表达式包在括号里以便在$((...))中进行赋值,我们可以进行更为有效的简单算术.
如下面的例子:
#!/bin/sh
x=0
while [ “$x” -ne 10 ]; do
echo $x
x=$(($x+1))
done
exit 0
参数扩展
我们在前面已经看到了参数分配与扩展的最简单形式,在那里我们是这样写的:
foo=fred
echo $foo
当我们要在一个变量的结尾处加上另外的一个字符时却会发生问题.假设我们要写一个简短的脚本来处理名为1_tmp和2_tmp的文件,我们可以试着用下面的脚本来处理:
#!/bin/sh
for i in 1 2
do
my_secret_process $i_tmp
done
但是在每一个循环中,我们会得到下面的信息:
my_secret_process: too few arguments
发生了什么错误呢?
问 题就在于Shell会试着将变量$i_tmp用他的变量值进行替换,但是却并不存在这个变量.而Shell并不会认为这是一个错误,而只是用空值来进行替 换,所以并没有参数传递给my_secret_process.要将$i的扩展保护为变量的一部分,我们需要将i放在一对花括号中:
#!/bin/sh
for i in 1 2
do
my_secret_process ${i}_tmp
done
这样以后在第一个循环中,i的值会用${i}进行替换,从而给出一个实际的文件名.这样我们就已经将一个参数的值替换为一个字符串了.
我们可以在Shell中进行许多的替换.常常这样的方法会为参数的处理问题提供一个优雅的解决方法.
常用到的一些如下表:
${parm:-default}    如果一个参数为空,则将他设定为一个默认值.
${#parm}        给出参数的长度.
${parm%word}        从末尾开始,移除与word相匹配的最小部分并返回其余的部分.
${parm%%word}        从末尾开始,移除与word相匹配的最长部分并返回其余的部分.
${parm#word}        从开头开始,移除与word相匹配的最小部分并返回其余的部分.
${parm##word}        从开头开始,移除与word相匹配的最长部分并返回其余的部分.
这些替换对于我们要处理字符串来说是相当有用的.而最后的四个可以用来移除字符串中的部分内容,而这对于处理文件名和路径是更为有用的.如下面的一些例子中所示的:
#!/bin/sh
unset foo
echo ${foo:-bar}
foo=fud
echo ${foo:-bar}
foo=/usr/bin/X11/startx
echo ${foo#*/}
echo ${foo##*/}
bar=/usr/local/etc/local/networks
echo ${bar%local*}
echo ${bar%%local*}
exit 0
如果我们运行这个脚本我们会得到下面的输出结果:
bar
fud
usr/bin/X11/startx
startx
/usr/local/etc
/usr
工作原理:
第一个句子,${foo:-bar},会为foo的值指定为bar,因为当这个语句开始执行时并没有为foo指定任何值.foo的值会保持不变直到他遇到unset语句.
在这里我们有一些需要我们注意的内容:
${foo:=bar}将会设置变量$foo.这个字符串运算符会检测foo存在并且不为空值.如果他不为空,则会返回他的值,但是如果是相反的情况,就会将foo的值设为bar并且会返回替换的结果值.
${foo:?bar}会打印出foo: bar,而如果foo并不存在或是他被设为空值则会退出命令.
最后,${foo:+bar},如果foo存在并且不为空则会返回bar.
{foo#*/}语句进行匹配并且只是移除左面的内容(在这里我们要记住*匹配0个或是多个字符).{foo##*/}进行匹配并会移除尽可能多的内容,所以他会移除了最右面的/以及他前面的所有字符.
{bar%local*}语句匹配从右面开始直到第一次出现local的字符,而{bar%%local*}会从右面开始匹配尽可能多的字符,直到第一次发现local.
因为Unix和Linux都比较强的依赖于过滤的概念,所以我们常常要将一个操作的执行结果进行手工重定向.假设我们要使用cjpeg命令将一个GIF的文件转换为JPEG的文件:
$ cjpeg image.gif &gt; image.jpg
也许有时我们会在大量的文件上进行这样的操作.这时我们如何自动重定向?我们可以很容易的这样来做:
#!/bin/sh
for image in *.gif
do
cjpeg $image &gt; ${image%%gif}jpg
done
这个脚本可以将当前目录下的每一个GIF文件转换成为JPEG文件.
<p id="TBPingURL">Trackback: http://tb.blog.csdn.net/TrackBack.aspx?PostId=663755</p>
