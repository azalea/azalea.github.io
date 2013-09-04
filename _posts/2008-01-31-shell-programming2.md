---
layout: post
title: Shell编程(二)—Shell基本语法 zz
tags:
- linux
- Shell编程
- ubuntu
- zz
status: publish
type: post
published: true
meta:
  views: '773'
  _wp_old_slug: shell%e7%bc%96%e7%a8%8b%e4%ba%8c-shell%e5%9f%ba%e6%9c%ac%e8%af%ad%e6%b3%95-zz
---
<a href="http://blog.csdn.net/mylxiaoyi/archive/2006/04/13/661422.aspx"> Shell编程(二)---Shell基本语法</a>

revised by azalea

		Shell语法
<strong> 变量:</strong>
在Shell 中,我们在使用变量之前并不需要进行声明.相反我们可以在需要的时候进行简单的使用就可以了.在默认的情况下,所有的变量都是作为字符串进行存储的,虽然 有时我们会用数字为其赋值.Shell以及其他的一些实用的转换程序会将数字字符串转换成相应的值为进行操作.在Linux系统中是要区分大小写的,所以在 Shell看来变量foo与Foo是不同的.
在Shell中访问变量的值,要在变量前加上一个$.为变量赋值时,可以只使用变量的名字,Shell会在需要的时候进行动态创建.检测变量内容一个简单的办法就是在终端进行输出,这时要在变量前加上一个$.

<!--more-->
在命令行中我们可以用下面的方法来设置和检测变量的值:
$ salutation=Hello
$ echo $salutation
Hello
$ salutation=”Yes Dear”
$ echo $salutation
Yes Dear
$ salutation=7+5
$ echo $salutation
7+5
我们还可使用<strong>read</strong>命令将用户的输入赋值给变量.这样就会将变量的名字作为参数并会等待用户的输入.read命令会在用户输入回车的时候结束.当从终端读入变量时我们并不需要使用引号.如下面的例子:
$ read salutation
Wie geht’s?
$ echo $salutation
Wie geht’s?
引号:
在继续我们的学习之前我们要清楚引号的作用.
通常脚本中的参数是由空白字符来分隔的,如空格,Tab或是回车.如果我们要我们的参数包含一个或是更多个参数,我们就要使用引号了.
例如变量$foo的行为要看我们使用的引号的类型了.如果我们是用双引号,在这一行执行时就会用他的值进行替换,而如果我们使用单引号就不会发生这样的替换.我们还可以使用转义字符来除去$的特殊意义.
在通常的情况下,我们双引号来包含字符串,这样就可以防止变量被空白符所分隔,而且会用变量的值进行替换.
在下面的这个例子中我们就会看到引号对于变量输出的影响:
#!/bin/bash
myvar=”Hi there”
echo $myvar
echo “$myvar”
echo ‘$myvar’
echo $myvar
echo Enter some text
read myvar
echo ‘$myvar’ now equals $myvar
exit 0
这个程序的输出为:
Hi there
Hi there
$myvar
$myvar
Enter some text
Hello World
$myvar now equals Hello World
工作原理
我们创建了变理myvar,并赋值为Hi there.变量的内容由命令echo显示出来,从而可以看出$字符扩展对变量内容的影响.从这输出我们可以看出双引号并不会影响变量的替换,而单引号和反斜线却会有这样的影响.我们同时使用一个read命令来从用户得到输入.

<strong> 环境变量</strong>
当启动一个Shell脚本时,一些变量会由环境中的值进行初始化.在脚本中这些变量通常为大写字母,从而与用户定义的变量进行区分,而用户定义的变量常用小写字母来表示.创建的变量依赖于我们个人的配置.其中的许多列在手册页中,但是基本的一些列在下面的表中:
$HOME    当前用户的主目录
$PATH    用来进行命令查找的由冒号分隔的目录列表
$PS1    命令提示,通常为$,但是在bash中我们可以使用更为复杂的值.例如,字符串[u@h W]$是流行的默认用法来告诉我们当前的用户,机器名称以及当前的工作目录,同时给出$提示.
$PS2    第二提示符,当提示额外的输入时使用,通常为&gt;
$IFS    输入区域分隔符.当Shell读入输入时会使用一个字符列表来分隔输入的单词,通常是空格,tab和新行字符.
$0    Shell脚本的名称.
$#    传递的参数个数.
$$    脚本的进程ID,通常用在一个脚本内部用来建立唯一的一个临时文件,如/tmp/tmp-file_$$.
如果我们的脚本调用一些参数,那么会建立一些其他的变量.即使没有传递参数,环境变量$#仍然存在,但是值却为0.
参数变量列在下面这个表中:
$1,$2,...    传递给脚本的参数.
$*    以单变量的形式显示所有的参数列表,由环境变量IFS中的第一个字符分隔.
$@    $*的一个灵巧变形.他并不使用IFS环境变量,所以如果IFS为空那么所有的所有的参数会一起运行.
我们可以通过下面的测试容易的看出$@和$*的区别:
$ IFS=’’
$ set foo bar bam
$ echo “$@”
foo bar bam
$ echo “$*”
foobarbam
$ unset IFS
$ echo “$*”
foo bar bam
正如我们所看到的,在双引号内,$@将参数进行分隔显示,而与IFS的值无关.通常来说,如果我们要访问参数,$@是一个很灵敏的选择.
我们不仅可以用echo命令打印出变量的内容,而且我们可以使用read命令来读取他们的内容.
参数和环境变量
下面的脚本展示了简单变量的处理.在我们输入了下面的脚本内容并保存为try_var,我们一定要记得用命令chmod +x try_var为其加上可执行权限.
#!/bin/sh
salutation=”Hello”
echo $salutation
echo “The program $0 is now running”
echo “The second parameter was $2”
echo “The first parameter was $1”
echo “The parameter list was $*”
echo “The user’s home directory is $HOME”
echo “Please enter a new greeting”
read salutation
echo $salutation
echo “The script is now complete”
exit 0
如果我们运行这个脚本我们会得到下面的输出:
~$ ./try_var.sh foo bar baz
Hello
The program ./try_var.sh is now running
The second parameter was bar
The first parameter list was foo bar baz
The user's home directory is /home/mylxiaoyi
Please enter a new greeting
hello
The script is now complete
工作原理:
这个脚本创建了一个名为salutation的变量并显示他的内空,然后显示了各种参数变量,而环境变量$HOME已经存在并且已经有适当的值.

<strong>函数:</strong>
所有程序语言的基本原则是测试条件并在这些测试的基础上进行各种不同的操作.在我们讨论这个话题之前,我们先来看一下在Shell脚本中我们会用到的函数构造以及我们要使用的控制结构.
一个Shell脚本可以测试由命令行调用的任何命令的返回代码,包括我们自己书写的脚本.这就是我们在每一个Shell脚本最后包含exit代码的重要原因.
test或[命令:
事实上,大多数的脚本大量的使用了Shell真假检测的test或是[命令.在大多数的系统上,[和test命令是同义的,但是当使用了一个[命令时而同时为了可读在末尾使用了一个]命令.使用[命令看起来有一点奇怪,但是这个命令在代码中会使得命令的语法看起来要简单,整洁,并且与其他的程序语言很相像.
ls -l /usr/bin/[
-rwxr-xr-x 1 root root 25040 2005-11-16 21:17 /usr/bin/[
我们会使用一个简单的测试例子来介绍test命令:检测一个文件是否存在.用于这个目的的命令是test -f &lt;filename&gt;,所以我们可以用下面的脚本:
if test -f fred.c
then
...
fi
我们也可以像下面的样子来写:
if [ -f fred.c ]
then
...
fi
test命令的返回代码(条件是否满足)决定于条件代码是否运行.
在这里我们要注意是我们必须在[和条件之间用空格进行分隔.我们可以用下面的方法来记住这一点:[是test命令的另一种写法,而我们要在test命令后输入空格.
如果我们喜欢将then与if放在同一行,我们必须要加一个冒号来与then进行分隔:
if [ -f fred.c ]; then
...
fi
我们可以用的test命令的条件类型有以下的三种:字符串比较,算术比较和文件条件.下面的三张表展示了这些条件类型:
字符串比较:
string1 = string2    如果相等则为真
string1 != string2    如果不等则为真
-n string        如果不空则为真
-z string        如果为空则为真
算术比较:
expression1 -eq expression2    如果相等则为真
expression1 -ne expression2    如果不等则为真
expression1 -gt expression2    如果大于则为真
expression1 -ge    expression2    大于等于则为真
expression1 -lt expression2    如果小于则为真
expression1 -le expression2    小于等于则为真
!expression            如查为假则为真
文件:
-d file        如果为目录则为真
-e file        如果存在则为真(在这里要注意的是,由于历史原因,-e选项并不可移植,所以常用的是-f选项
-f file        如果为常规文件则为真
-g file        如果设置了组ID则为真
-r file        如果文件可读则为真
-s file        如果文件大小不为零则为真
-u file        如果设置了用户ID则为真
-w file        如果文件可写则为真
-x file        如果文件可执行则为真
现在我们似乎走得有一点的太前了,但是接下来的是一个例子.在这里我们要测试文件/usr/bash,这样我们就可以清楚的看到这些条件的用法:
#!/bin/sh
if [ -f /bin/bash ]
then
echo “file /bin/bash exists”
fi
if [ -d /bin/bash ]
then
echo “/bin/bash is a directory”
else
echo “/bin/bash is NOT a directory”
fi
在测试为真以前,所有的文件测试条件要法度文件存在.这个列表包含了test命令常用的选项,所以我们可查看手册页得到一个完全的信息.如果我们正在使用bash,而其中内嵌了test,我们可以用命令help test得到详细的信息.
Trackback: http://tb.blog.csdn.net/TrackBack.aspx?PostId=661422