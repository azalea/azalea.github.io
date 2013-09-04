---
layout: post
title: Shell编程(四)—Shell内建命令简介 zz
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
  _wp_old_slug: shell%e7%bc%96%e7%a8%8b%e5%9b%9b-shell%e5%86%85%e5%bb%ba%e5%91%bd%e4%bb%a4%e7%ae%80%e4%bb%8b-zz
  _sg_subscribe-to-comments: 1sk@126.com
---
<a href="http://blog.csdn.net/mylxiaoyi/archive/2006/04/14/663660.aspx"> Shell编程(四)---Shell内建命令简介</a>

		命令
我 们从一个Shell脚本的内部执行两种类型的命令。也就是通常（normal）的命令，这样的命令我们也可以在命令行的方式下来运行，称为处部命令，另一 种就是我们前面所说的内建（built-in）命令，称之为内部命令。内建命令是在Shell的内部来实现的而不能为外部程序所调用。然而大多数的内部命 令也会作为相对独立的单一程序来提供，而这也是POSIX 标准所要求的一部分。通常来说内部命令与外部命令并没有太大的区别，除非是这个内部运行得更为高效。
然而在这里我们只会讨论一些主要的命令，包括我们编写一下脚本时所需要用到的外部与内部命令。作为一个Linux用户我们会知道一些其他的可以在命令行来运行的命令。我们应该记住除了我们在这里所提到一些内建命令以后我们还可以在脚本中使用我们所知道的一些其他的命令。

<!--more-->
break
当 我们要从一个for，while或是until循环中退出时我们可以使用这个命令。我们也可以传递给break另外一个数字参数，而这个数字参数正是我们 要退出的循环次数。因为这样会使得我们的脚本变得难于阅读，所以我们并不推荐大家来使用这样的方式。在默认的情况下，break只会退出单一的层次。如下 面的例子：
#!/bin/sh
rm -rf fred*
echo &gt; fred1
echo &gt; fred2
mkdir fred3
echo &gt; fred4
for file in fred*
do
if [ -d “$file” ]; then
break;
fi
done
echo first directory starting fred was $file
rm -rf fred*
exit 0
：命令
冒号命令只是一个空命令。这个命令用来作为true的别名而简化逻辑条件是相当有用的。因为他是一个内建的命令，所以他运行得要比true快速，然而他的输出却并不是易于理解的。
我们可以看到在while循环中使用这个命令。while ：可以替代更为常见的while true来实现无限的循环。
：结构在变量的设置条件中也是相当有用的，例如：
: ${var:=value}
如果没有：，shell会试着将$var作为一个命令来对待。
#!/bin/sh
rm -f fred
if [ -f fred ]; then
:
else
echo file fred did not exist
fi
exit 0
continue
与C语言相类似，这个命令可以使得for，while，until中的变量使用列表中的下一个值继续执行下一次循环。
#!/bin/sh
rm -rf fred*
echo &gt; fred1
echo &gt; fred2
mkdir fred3
echo &gt; fred4
for file in fred*
do
if [ -d “$file” ]; then
echo “skipping directory $file”
continue
fi
echo file is $file
done
rm -rf fred*
exit 0
continue命令后可以跟一个用来作为一个可选参数的数字，这样我们就可以部分的跳出嵌套循环。然而这样的参数并不常用，因为这样会使得我们的脚本难于理解。例如：
for x in 1 2 3
do
echo before $x
continue 1
echo after $x
done
这个脚本的输出结果如下：
before 1
before 2
before 3
。命令
。命令会在当前的Shell中执行命令：
。 。/shell_script
通常情况下，当一个脚本执行一个外部的命令或是脚本时，就会创建一个新的循环或是子Shell，这个外部命令会在新的环境下运行，然而这个新的环境就会无视返回给父Shell的返回代码。但是外部的资源和。命令使得被调用脚本中所列出的命令在同一个环境下来运行。
这 样就意味着在通常的情况下命令对环境变量所做的修改会丢失。而另一方面，。命令可以允许被执行的命令改变当前的运行循环。当我们要使用一个脚本作为包装来 为后来一些其他命令的运行设置环境时是相当有用的。例如：如果我们同时在几个不同的工程上进行工作，有时我们就会发现我们需要使用一个不同的参数来调用命 令，也许是调用一个老版本的编译器来维护一个古老的程序。
在Shell脚本中，。（dot）命令的工作方式与C或是C++中的#include的工作方式相类似。虽然他并不真正包含一个脚本，但是他确实是在当前的条件下运行命令，所以我们可以使用这个命令在一个脚本中进行变量或是函数定义的合并。
在下面的这个例子中，我们在命令行的方式下使用dot命令，但是我们也可以在一个脚本中使用这个命令。
1 假设我们有两个文件，而这两个文件所包含是为两个不同的开发环境所做的环境设置。要为古老的，经典的命令设置环境，classic_set,我们可以使用下面的命令：
#!/bin/sh
version=classic
PATH=/usr/local/old_bin:/usr/bin:/bin:.
PS1=”classic&gt; “
2而对于新的命令我们使用latest_set:
#!/bin/sh
version=latest
PATH=/usr/local/new_bin:/usr/bin:/bin:.
PS1=” latest version&gt; “
我们可以使用dot命令将这些脚本进行合并来设置环境，如下面的操作：
$ . ./classic_set
classic&gt; echo $version
classic
classic&gt; . latest_set
latest version&gt; echo $version
latest
latest version&gt;
echo
仅管在现代的Shell中使用printf命令，但是在这里我们仍然遵循通常的习惯来使用echo命令后跟新行字符的字符串。
一个通常的问题就是如何来禁止一个新行字符。不幸的，不同版本的Unix实现了不同的解决方法。在Linux中通用的作法是：
echo -n “string to output”
但是也许我们常会看到下面的情况：
echo -e “string to outputc”
在第二种方法，echo -e确保允许解释一些转义字符，例如新t解释为tab，而将n解释为回车换行。这在通常的情况下是默认的设置
eval
eval命令允许我们进行参数的赋值。他是Shell的内建命令而并不作为一个单独的命令而存在。下面一个从X/Open所借用来的简短的例子可以很好的说明这个问题。
foo=10
x=foo
y=’$’$x
echo $y
这个例子的输出结果为$foo，然而如果我们用下面的例子：
foo=10
x=foo
eval y=’$’$x
echo $y
这样的输出结果就为10.这样eval就有一些像另外的一个$：他会提供给我们一个变量的值。
eval命令是非常有用的，他会允许我们随时创建和运行代码。他确实会将脚本的高度复杂化，但是他却会允许我们做一些平常来说非常困难甚到是不可能的事情。
exec
exec命令有两种不同的用法。他最通常的用法是用一个不同的程序来替换当前的Shell。例如；
exec wall “Thanks for all the fish”
在脚本中会使用wall命令来替换当前的Shell。在exec命令之后的脚本内容不会处理，因为执行这个脚本的Shell已经不存在了。
exec的第二种用法就是用来修改当前文件的描述符：
exec 3&lt; afile
这个结果是是为了从文件afile文件中读入内容而打开文件描述符3.这样有用法并不常见。
exit n
exit命令会使得脚本返回返回代码。如果我们是在交互的Shell中运行这个命令，他就会使得我们退出会话。如果我们不指定我们的脚本不指定返回状态而退出，那么脚本中上一次命令的执行结果就会作为返回值。通常指定返回值是一个很好的做法。
在Shell编程中，返回代码0为成功，1到125是错误代码，这些错误代码可以为脚本所使用。保留的值具有保留的含义：
126    文件是不可执行的
127    命令没有找到
128及以上    发生信号
使用0作为成功代码在许多的C或是C++程序员看来会有一些的不同。这最大的优点就是在脚本中允许我们使用125种用户定义的错误代码而不需要全局错误代码变量。
在下面这个例子中，如果在当前的目录下存在。profile文件就回成功值。
#!/bin/sh
if [ -f .profile ]; then
exit 0
fi
exit 1
如果我们是一个甘受惩罚的人或者是需要简洁的脚本，我们可以用我们在前面见过的AND和OR列表来重写我们的脚本，而将所有的内容放在一行：
[ -f .profile ] &amp;&amp; exit 0 || exit 1
export
export 命令可以使得变量以其子Shell中的参数进行命令.在默认的情效况下,在一个Shell中所创建的变量在另一个所调用的Shell中并不是可见的. export命令可以由他的参数创建一个环境变量,这个变量可以为当前程序中所调用的其他的脚本或是程序可见.更为技术的一点来说,由任何子进程序所引进 的环境变量是由这个Shell派生的.这个命令的含义以及用法可以从下面的两个脚本export1和export2来很好的进行演示.
我们先列出export2的脚本内容:
#!/bin/sh
echo “$foo”
echo “$bar”
下面的是export1中的内容,在这个脚本的结尾处我们调用export2:
#!/bin/sh
foo=”The first meta-syntactic variable”
export bar=”The second meta-syntactic variable”
export2
如果我们运行这个脚本我们可以得到下面的结果:
$ export1
The second meta-syntactic variable
$
之所以发生第一行的空行是因为在export2中变量foo并不是可见的,所以$foo被赋值为空值,输出一个空的变量就会得到一个新行.
一旦一个变量由一个Shell引入,那么他在由这个Shell中所派生的或是在这个Shell中所依次调用的脚本中都是可见的.如果脚本export2调用了另一个脚本,那么对于另一个脚本来说这个变量的值仍然是可见的.
命令set -a或是set -allexport可以引入所有的变量.
expr
expr命令会将他的参数作为一个表达式来对待.他最常见的用法是用在如下面形式的简单算术中:
x=`expr $x + 1`
在这里的反引号(`)是将命令expr $x+1的结果作为变量x的值.我们也可以用语法$()来写这个句子而不使用反引号的形式,如下面的形式:
x=$(expr $x + 1)
expr命令是一个相当强大的命令,他可以处理许多表达赋值的问题.他的一些原则如下表所示:
expr1 | expr2    如果expr1不为空则为expr1,否则为expr2
expr1 &amp; expr2    如果expr2或是expr1为零则为零,否则为expr1
expr1 = expr2    相等
expr1 &gt; expr2    大于
expr1 &gt;= expr2    大于等于
expr1 &lt; expr2    小于
expr1 &lt;= expr2    小于等于
expr1 != expr2    不等于
expr1 + expr2    相加
expr1 - expr2    相减
expr1 * expr2    相乘
expr1 / expr2    整数相除
expr1 % expr2    整数取模
printf
printf命令只在现代的Shell中可用.X/Open建议我们最好应使用echo来产生格式化的输出.
语法格式如下:
printf “format string” parameter1 parameter2 ...
字 符串的格式与我们在C或是C++中所见到的相类假,只是有一些限制.主要的区别在于Shell并支持浮点数,因为Shell中的所有算术运算都是作为整数 来处理的.格式化字符串可以由字母,转义序列和转义符的任何组合来构成.在格式化字符串中除了%和的所有字符都可以进行精确的输出.
下面列出的是可以支持的转义序列:
\    反斜线
a    警告
b    退格
f    形成输入字符
n    新行字符
r    回车
t    Tab字符
v    垂直Tab
ooo    由八进制表示的单个字符
转义字符是相当复杂的,所以我们在这里只是列出一些我们会常用到的内容.更为详细的内容可以在在线的bash手册中得到.转义字符是%和紧跟其后的要转义的字符组成的.下面列出一些主要的转义字符:
d    输出十进制数
c    输出一个字符
s    输出一个字符串
%    输出%字符
然后我们会使用格式化字符串来解释其余的参数并进行结果的输出.例如:
$ printf “%sn” hello
hello
$ printf “%s %dt%s” “Hi There” 15 people
Hi There 15   people
在这里我们要注意我们必须使用""来使得Hi There字符串成为一个单一的参数.
return
return命令会使得一个函数返回.我们在前面的一些函数的用法中已经注意到了这一点.return命令会返回一个单一的数字参数,而这个数字参数在调用这个函数的脚本中是可见的.如果没有指定返回参数,return在默认情况下会返回上一次命令的返回代码.
set
set命令会为Shell设置参数变量.这对于在输出由空格区分的命令中使用域是很有用的一个方法.
假 如我们要在我们的Shell脚本中使用当前月份的名字.系统提供了一个日期的命令,这个命令含有字符串形式的月份,但是我们需要将他与其他的区域进行分 离.我们可以使用set命令和$(...)结构的组合来执行日期命令并返回结果.日期命令的输出是将月份的字符串作为他的第二个参数.
如下面的例子:
#!/bin/sh
echo the date is $(date)
set $(date)
echo The month is $2
exit 0
这个程序为date命令的输出设置了参数列表,并且使用第二个参数$2来得到月份的名字.
在这里我们要注意的是我们使用date命令来作为一个简单的例子来展示如何解开位置参数.因为date命令是与语言设置有关的,而事实上我们可以使用命令date +%B来得到月份的名字.date还有许多其他的格式选项,我们可以从他的手册页中得到更为详细的说明.
我们还可以使用set命令来控制通过传递Shell参数的Shell执行方式.这最通常的用法是使用命令set -x,这样就会使得一个脚本显示他当前执行命令的轨迹.
shift
shift 命令可以使得所有的参数变量值减1,这样$2就会变为$1,而$3就会变为$2,依次类推.这样以后$1的值就会丢弃,而$0的值会保持不变.如果在调用 shift命令时指定了一个数字参数,那么这些参数也会移动一些相应的位置.而其他的一些变量,$*,$@,$#也会为新的参数变量的范围进行相应的修 改.
shift命令在参数之中进行扫描是相当有用的,如果我们的脚本需要10个或是更多的参数,那么我们就需要使用shift来访问10个或是更多的内容.
作为例子,我们可以像下面的形式来扫描所有的位置参数:
#!/bin/sh
while [ “$1” != “” ]; do
echo “$1”
shift
done
exit 0
trap
trap 命令可以用来指定在收到信号时所要进行的动作.一个常见的用法是在一个脚本被中断时所做的处理工作.由于历史的原因,Shell总是使用数字来代表信号, 但是新的脚本可以通过#include signal.h并且忽略SIG前缀来使用信号的名字.如果我们要查看信号的数字和其相关的名字我们可以在命令提示下输入trap -l命令.
trap命令可以通过紧跟信号的名字的方式来传递将要进行的动作:
trap command signal
我们要记住通常情况下脚本是从上到下进行解释的,我们必须在我们要保护的脚本部分之前来指定trap命令.
要将一个trap的条件设置为默认的情况,我们可以简单的将命令指定为-.要忽略一个信号,我们可以将命令设为空串``.一个没有任何参数的trap命令会打印出当前的动作列表.
下面的表格列出了一些比较重要的标准的X/Open信号,这些信号都可以被捕获.更为详细的内容我们可以从信号手册中得到.
HUP(1)    挂起.通常是当一个终端离线或是用户退出时发出.
INT(2)    中断.通常是通过按下Ctrl+C发出的.
QUIT(3)    退出,通常是由Ctrl+发出的.
ABRT(6)    中止,通常是由一些严重的运行错误发出的.
ALRM(14) 警告.通常是由处理超时发出的.
TERM(15) 结束.通常是当系统关机时发出的.
下面的脚本模拟了一些简单信号的处理:
#!/bin/sh
trap ‘rm -f /tmp/my_tmp_file_$$’ INT
echo creating file /tmp/my_tmp_file_$$
date &gt; /tmp/my_tmp_file_$$
echo “press interrupt (CTRL-C) to interrupt ....”
while [ -f /tmp/my_tmp_file_$$ ]; do
echo File exists
sleep 1
done
echo The file no longer exists
trap INT
echo creating file /tmp/my_tmp_file_$$
date &gt; /tmp/my_tmp_file_$$
echo “press interrupt (control-C) to interrupt ....”
while [ -f /tmp/my_tmp_file_$$ ]; do
echo File exists
sleep 1
done
echo we never get here
exit 0
如果我们运行这个命令,我们在每一个循环中按下Ctrl+C,我们就会得到下面的输出:
creating file /tmp/my_tmp_file_141
press interrupt (CTRL-C) to interrupt ....
File exists
File exists
File exists
File exists
The file no longer exists
creating file /tmp/my_tmp_file_141
press interrupt (CTRL-C) to interrupt ....
File exists
File exists
File exists
File exists
工作原理:
这 个脚本使用trap命令来为命令rm -f /tmp/my_tmp_file_$$执行时接收到INT信号时安排将会执行的动作.然后这个脚本会进入一个循环直到文件存在.当用户按下Ctrl+C 时,语句rm -f /tmp/my_tmp_file_$$被执行,然后这个循环会重新开始.因为这个文件已经被删除了,所以第一个while循环会正常的结束.
这 个脚本然后会再一次使用trap命令,这一次是要指定当INT信号发生时没有命令被执行.他会重新创建这个文件并进入第二个循环语句.如果用户在这时按下 Ctrl+C时,没有配置要执行的语句,所以会发生默认的动作,即立即终止脚本.因为这个脚本是立即被终止的,所以最后的echo和exit命令并不会执 行.
unset
unset命令会从当前的环境中移除变量或是函数.但是对于Shell自己定义的只读的变量(例如IFS)不可以进行这样的操作.这个命令并不是经常使用.
例如下面的这个例子:
#!/bin/sh
foo=”Hello World”
echo $foo
unset foo
echo $foo
Trackback: http://tb.blog.csdn.net/TrackBack.aspx?PostId=663660