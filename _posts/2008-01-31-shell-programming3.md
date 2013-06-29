---
layout: post
title: Shell编程(三)—控制结构及函数  zz
tags:
- linux
- Shell编程
- ubuntu
- zz
status: publish
type: post
published: true
meta:
  views: '624'
  _wp_old_slug: shell%e7%bc%96%e7%a8%8b%e4%b8%89-%e6%8e%a7%e5%88%b6%e7%bb%93%e6%9e%84%e5%8f%8a%e5%87%bd%e6%95%b0-zz
---
<a href="http://blog.csdn.net/mylxiaoyi/archive/2006/04/13/661988.aspx"> Shell编程(三)---控制结构及函数</a>

<p class="postText">		控制结构
Shell有一结构控制集合,我们再一次说明他们与其他的程序语言非常相像.
If
if语句是相当简单的:他测试一个命令的结果,并且有选择的执行一组语句:
if condition
then
statements
else
statements
fi

<p class="postText"><!--more-->
使用if命令:
下面的这个例子中显示if的普通用法,他会询问一个问题并依据这个问题来进行回答:
#!/bin/sh
echo “Is it morning? Please answer yes or no”
read timeofday
if [ $timeofday = “yes” ]; then
echo “Good morning”
else
echo “Good afternoon”
fi
exit 0
这会产生下面的输出:
$ ./if.sh
Is is morning? please answer yes or no
yes
Good morning
这个脚本使用[命令来测试变量timeofday的值.这个结果会被if命令来使用,从而会执行不同的程序代码.
elif
但是不是幸的是,对于这个简单的脚本却有着许多的问题.他会将yes以外的任何答案理解为no.为了防止这样的问题出现我们可以使用elif结构,这样就会允许我们在if执行else部分时添加第二个条件.
我们可以修改上面的脚本以使用当用户输入yes或no以外的内容时报告错误信息.我们的做法是用elif来代替else从而添加另一个条件.
#!/bin/sh
echo “Is it morning? Please answer yes or no”
read timeofday
if [ $timeofday = “yes” ]
then
echo “Good morning”
elif [  $timeofday = “no” ]; then
echo “Good afternoon”
else
echo “Sorry, $timeofday not recognized. Enter yes or no”
exit 1
fi
exit 0
工作原理:
这与上一个例子较为相似,但是在这一次如果if的测试条件不为真则使用elif命令测试变量的值.如果这些没有一个成功,则会打印出一条错误信息并且脚本退出并返回代码1,而返回值则可以用作另一个调用此脚本的程序查看脚本是否成功.
变量的问题:
现在修正了一个最明显的问题,但是却潜伏着另一个更细小的问题.我们可以试一下这个新脚本,但是我们仅是输入回车(或是其他的内容)而不回答这个问题,我们就会得到下面的错误信息:
[: =: unary operator expected
出了什么样的错误呢?问题就在于第一个if语句,当这个变量timeofday进行了测试,他包含一个空串.所以这样if语句看起来就是下面的样子:
if [ = “yes” ]
而这并不是一个可用的条件.为了避免这样的问题,我们可以用双引号将变量括起来:
if [ “$timeofday” = “yes” ]
当传递一个空变量给这个测试时:
if [ “” = “yes” ]
我们的新脚本如下:
#!/bin/sh
echo “Is it morning? Please answer yes or no”
read timeofday
if [ “$timeofday” = “yes” ]
then
echo “Good morning”
elif [ “$timeofday” = “no” ]; then
echo “Good afternoon”
else
echo “Sorry, $timeofday not recognized. Enter yes or no”
exit 1
fi
exit 0
这样对于只是回车的答案来说就是一个安全的脚本了.
for
我们用for结构在任何字符串的集合的值范围内进行循环.他们可以简单的列在程序中,或是更为一般的,可以是文件名的Shell扩展结果.
语法如下:
for variable in values
do
statements
done
在下面的这个例子中,值为普通的字符,所以我们的脚本如下:
#!/bin/sh
for foo in bar fud 43
do
echo $foo
done
exit 0
我们会得到下面的结果:
./for.sh
bar
fud
43
工作原理:
这个例子创建了一个变量foo,并且在for循环中每次赋于一个不同的值.因为Shell在默认的情况下认为所有的变量都包含字符串,所以在例子中就会像使用字符串fud一样的来使用43.
使用通配符
正如我们在前面的那样,通常情况下我们会在for循环中使用文件名的Shell扩展.我们这样说的意思是在字符串值中使用通配符,并且使得Shell在运行时填充所有的值.
我们已经在我们最初的例子中看到这个例子.这个脚本使用了Shell扩展,*扩展成为当前目录下的所有文件名.这些中的每一个在for循环中轮流用作变量$i的值.
下面我们看一下另一个通配符的例子.想像一下如果我们要打印所有当前的目录下文件名中含有f字符的文件,而且我们知道我们所有的脚本以.sh结尾.我们可以用下面的脚本来完成我们的工作
#!/bin/sh
for file in $(ls f*.sh); do
lpr $file
done
exit 0
工作原理:
这里我们展示了$(command)的语法.基本来说,for命令所使用的参数列表是由包含在$()中的命令的输出来提供的.这个脚本将f*.sh扩展成所有与这个模式匹配的内容.
while
因为在默认的情况下认为Shell值为字符串,因而for循环对于在一系列的字符间进行循环是一个不错的选择,但是对于处理确定次数的循环命令来说就显得有一些笨拙了.
下面这个例了向我们展示了当我们用for循环来在20个数之间进行循环是一件多么麻烦的事情:
#!/bin/sh
for foo in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
do
echo “here we go again”
done
exit 0
即使是我们使用通配符进行扩展,我们有时也会遇到不能确定我们所需要的循环次数.在这样的情况下,我们可以使用while循环,其语法格式如下:
while condition do
statements
done
如下面的一个进行密码检测的例子:
#!/bin/sh
echo “Enter password”
read trythis
while [ “$trythis” != “secret” ]; do
echo “Sorry, try again”
read trythis
done
exit 0
其输出结果如下:
Enter password
password
Sorry, try again
secret
$
事实上这并不是安全的检测密码的方法,但是却可以很好的展示了while语句的用法.在do和done之间的语句将会被连续执行直到我们的测试条件不再为 真为止.在我们的输出例子中我们检测到trythis的值与secret并不相等,循环将会继续直到$trythis与secret相等为止.然后我们就 会执行done后的语句.
将while语句与算术运算进行组合我们就可以执行确定次数的循环操作.这要比我们刚才所看到的for的例子要简单得多.
#!/bin/sh
foo=1
while [ “$foo” -le 20 ]
do
echo “Here we go again”
foo=$(($foo+1))
done
exit 0
工作原理:
这个脚本使用[命令来检测foo的值并与20进行对比,如果小于或是等于则要执行循环体.在这个while循环中,(($foo+1))语法用来执行花括号内的算术运算,所以foo的值会在每一个循环后增加1.
因为foo不可以是一个空串,所以我们在在测试他的值时不需要用双引号来保护.我们这样做是因为这是一个好习惯.
until
until语句语法格式如下:
until condition
do
statements
done
这与while循环十分相似,所不同的只是测试条件的相反.换句说,until是循环继续直到条件为真,而不是while的条件为真时才进行循环.
until语句适用于我们希望进行循环直到某件事发生时为止的情况.作为一个例子,我们可以考虑下面的情况:当我们在命令行中输入另一个用户名进行登陆时发出响铃.
#!/bin/sh
until who | grep “$1” &gt; /dev/null
do
sleep 60
done
# now ring the bell and announce the expected user.
echo -e \a
echo “**** $1 has just logged in ****”
exit 0
下面我们要说是case结构.case结构比起我们已经讨论这些内容来说要显得有一些复杂.他的语法如下:
case variable in
pattern [ | pattern] ...) statements;;
pattern [ | pattern] ...) statements;;
...
esac
这种结构看起来有一些吓人,但是case结构却可以使得我们用一种诡异的方法来匹配变量的内容并且会依据所匹配的模式执行不同的语句.
在这里我们要注意第一个模式行是用双分号来分隔的.我们可以在第一个不同的模式之间放置多条不同的语句,所以我们需要使用双分号来标记一个模式的结束和另一个模式的开始.
case结构匹配多个模式并执行多个不同的相关的语句的能力使得这种结构可以很好的来处理用户的输入.展示case工作原理的最好的方法就是一个实际的例子.如下面的一个例子:
现在我们可以写一个新的处理用户输入的脚本版本,现在我们使用case结构,这样可以使得他更具选择并且可以处理不可辨识的输入.
#!/bin/sh
echo “Is it morning? Please answer yes or no”
read timeofday
case “$timeofday” in
yes) echo “Good Morning”;;
no ) echo “Good Afternoon”;;
y ) echo “Good Morning”;;
n ) echo “Good Afternoon”;;
* ) echo “Sorry, answer not recognized”;;
esac
exit 0
工作原理:
在这个脚本中,我们在每一种情况的输入中使用了多个字符串,这样case就会为每一个可能的语句检测一些不同的字符串.这样就会使得我们的脚本更为短小, 而且实际的来说也更为易读.我们同时展示了*通配符的用法,即使这也许会匹配不希望的情况.例如,如果用户输入了never,这样就会匹配n*并且会显示 Good afternoon,而这并不是我们所希望的行为.在这里我们要注意如果*通配符使用了引号就不会起作用了.
最后,如果我们要使得这个脚本可以重用,但使用最后一个匹配模式时我们需要一个不同的返回值.在这里我们同时也加入set结构.
#!/bin/sh
echo “Is it morning? Please answer yes or no”
read timeofday
case “$timeofday” in
yes | y | Yes | YES )
echo “Good Morning”
echo “Up bright and early this morning”
;;
[nN]*)
echo “Good Afternoon”
;;
*)
echo “Sorry, answer not recognized”
echo “Please answer yes or no”
exit 1
;;
esac
exit 0
工作原理:
为了显示模式匹配的一个不同的方法,我们改变量了no情况的使用方式.我们同时也显示了在case语句时中多条语句是如何执行的.在这里我们要注意的是我 们将最明显示匹配放在前面而将一般的匹配放在后面.这是比较重要的一点,因为case会首先执行他找到的第一个匹配模式,而并不是最佳的.如果我们将*) 放在前面,那么进行匹配的就是这种情况,而不论我们输入的是什么内容.
我们还要注意的一点就是esac前的;;是可选的.这里并不像C语言那样.
为了使得case的匹配更为强大的,我们可以用下面的形式:
[yY] | [Yy][Ee][Ss] )
这在允许多个答案时会限制允许输入的字符并且比*通配符有着更多的控制.
Lists:
有时我们会连接一系列的命令.例如我们在执行一个语句前需要多个限制条件,如下面的例子:
if [ -f this_file ]; then
if [ -f that_file ]; then
if [ -f the_other_file ]; then
echo “All files present, and correct”
fi
fi
fi
或者是我们希望一系列的条件为真,如:
if [ -f this_file ]; then
foo=”True”
elif [ -f that_file ]; then
foo=”True”
elif [ -f the_other_file ]; then
foo=”True”
else
foo=”False”
fi
if [ “$foo” = “True” ]; then
echo “One of the files exists”
fi
尽管我们可以用多个if语句来实现,但是我们会发现这样的结果是相当的烦人的.在Shell中有一对特殊的结构可以用来处理类似于这样的一列的命令:AND列和OR列.通常他们会在一起使用,但是在这里我们会分开来看他们的语法格式.
AND列:
AND列结构可以使得执行一系列的命令,只有在前面的命令都成功的情况下我们才可以执行下面的命令.他的语法如下:
statement1 &amp;&amp; statement2 &amp;&amp; statement3 &amp;&amp; ...
这些命令会由左边开始执行每一个命令,如果返回值为真会执行接下来的右边的命令.这个过程会连续进行执行一个命令的返回值为假,在这之后这个列表的中命令 也不再执行.&amp;&amp;会检测前一个命令的执行结果.每一个语句可以单独执行,这样就会允许我们在一个列表中执行不同的命令,就如下面的例子所 显示那样.如果这个列表中的所有命令都执行成功,那么这就是一个成功的命令,否则就是失败的.
在下面的这个脚本中,我们创建了file_one(先检查是否存在,如果不存在就先创建这个文件)然后移除file_two.然后AND命令列会检测每一个文件是否存在并会输入命令之间一个文本.
#!/bin/sh
touch file_one
rm -f file_two
if [ -f file_one ] &amp;&amp; echo “hello” &amp;&amp; [ -f file_two ] &amp;&amp; echo “ there”
then
echo “in if”
else
echo “in else”
fi
exit 0
如果我们运行这个脚本我们会得到下面的结果:
hello
in else
touch和rm命令来保证当前目录下的文件在一个已知的状态.&amp;&amp;表接下来执行[ -f file_one ]语句,这个语句是会成功的,因为我们刚刚保证这个文件的存在.因为前面一个语句成功了,所以执行echo命令.这也会成功(echo通常会返回真).然 后执行第三个语句,[ -f file_two ].这个语句不会成功,因为这个文件已经不存在.因为最后一个命令失败了,所以最后的echo语句并不会执行.&amp;&amp;表的结果为假,因为在 这个列表中有一个命令失败了,所以if语句会执行else条件.
OR表:
OR表的结构我可以允许我们执行一系列命令,直到有一个命令成功,然后就不再执行更多的命令.他的语法结构如下:
statement1 || statement2 || statement3 || ...
由左开始依次执行每一个语句.如果他的返回值为假,那么就会执行接下来的语句.这个过程会继续下去直到有一个语句返回真值,这样以后就不会再执行接下来的列表中的命令.
||列表与&amp;&amp;列表是非常相像的,所不同的只是执行下一个语句的条件.
如下面的一个例子:
#!/bin/sh
rm -f file_one
if [ -f file_one ] || echo “hello” || echo “ there”
then
echo “in if”
else
echo “in else”
fi
exit 0
我们会得到下面的输出结果:
hello
in if
工作原理:
脚本中的前两行只是简单的为脚本的其余部分设置文件.第一个命令 [ -f file_one ]会返回假,因为文件已经不存在.然后执行是echo命令.令人惊奇的是这会返回一个真值,所以在||命令列表就不会再有命令执行.因为在这个列表中有一 个命令返回真值,所以if语句成功.
这两个结构的结果是上一个要执行的语句的结果.
如果要进行多个条件的测试,我们可以偈在C语言中一样的来使用这些列表类的结构.我们可以将这两种结构结合在一起;
[ -f file_one ] &amp;&amp; command for true || command for false
如果测试成功将会执行第一个语句否则则会执行第二个语句.我们可以试验这些并不太常用的列表结构,而在通常情况下我们需要使用花括号来强制执行的顺序.
语句块:
如果我们要在一个地方使用多个语句但却只允许一个的时候,例如在AND或是OR列表中,我们可以用花括号将他们括起来形成一个语句块.
函数:
我们可以在Shell中定义函数,如果我们希望形成任何尺寸的脚本文件,我们可以用函数来结构化我们的代码.
要定义一个函数,我们只要写上函数的名字并跟随一个空的括号并将语句括在一个花括号内:
function_name () {
statements
}
如下面的一个简单的函数:
#!/bin/sh
foo() {
echo “Function foo is executing”
}
echo “script starting”
foo
echo “script ended”
exit 0
执行这个脚本我们会得到下面的输出:
script starting
Function foo is executing
script ending
工作原理:
这个脚本是由顶部开始执行的,所以在这里并没有什么不同的.但是当他发现foo(){结构,他就会知道在这里定义了一个函数调用.他会将foo指向一个函 数的情况进行存储并在}后继续执行.当执行foo()行时,Shell知道这里要执行一个前面定义的函数.当这个函数执行结束后,脚本就会在foo行后继 续执行.
我们必须在调用一个函数之前进行定义,这种风格有一些像Pascal的函数定义,所不同的只是在Shell并需要在前面进行声明.这并不是一个问题,因为 所有的脚本都是由顶部开始执行的,所以我们只需要简单的将我们要定义的全部函数放在这些函数中第一次调用之前,这样我们就解决了函数要先定义用调用的问 题.
当调用一个函数时,脚本中的参数,$*,$@,$#,$1,$2等等将会被函数中的参数所替换.这也是我们读取传递给函数参数的方法.当函数结束时,他们就会恢复成以前的值.
我们可以使用return命令来使得函数返回数字值.常用的做法是将函数返回的字符串存放在一个变量中,这样就可以在函数结束以后使用.
在这里我们要注意的是我们可以用local关键字在Shell函数中定义局部变量.这样这个变量就会只在这个函数中起作用.否则,一个函数可以访问在另一 个函数中定义的全局变量.如果一个局部变量与全局变量同名,那么在一个函数中这个变量就会覆盖掉全局变量.例如下面的这个列子:
#!/bin/sh
sample_text=”global variable”
foo() {
local sample_text=”local variable”
echo “Function foo is executing”
echo $sample_text
}
echo “script starting”
echo $sample_text
foo
echo “script ended”
echo $sample_text
exit 0
在没有用return命令返回值的情况下,函数会返回最后命令执行时的返回状态.
在我们下面的例子中，我们将会展示如何向函数传递一个参数以及一个函数如何返回一个真或是假的结果。我们可以使用一个名字作为参数来调用这个脚本。
1在脚本头后我们定义了一个yes_or_no函数：
#!/bin/sh
yes_or_no() {
echo “Is your name $* ?”
while true
do
echo -n “Enter yes or no: “
read x
case “$x” in
y | yes ) return 0;;
n | no ) return 1;;
*)         echo “Answer yes or no”
esac
done
}
2接下的是这个程序的主要部分：
echo “Original parameters are $*”
if yes_or_no “$1”
then
echo “Hi $1, nice name”
else
echo “Never mind”
fi
exit 0
当我们运行这个脚本时我们会得到下面的输出：
$ ./my_name Rick Neil
Original parameters are Rick Neil
Is your name Rick ?
Enter yes or no: yes
Hi Rick, nice name
$
工作原理：
当这个脚本执行时，定义了yes_or_no函数但是却并没有运行这个函数。在if语句中，这个脚本执行了了我们所定义的这个函数，并且在将$1用传递给 原脚本的第一个参数Rick进行替换，在这以后将句子的其他部分作为参数传递给函数。这个函数使用这些参数并将他们存放在位置参数$1,$2等当中，并向 调用者提供一个返回值。依据这个返回值，if结构语句可以执行相应的操作。
正如我们所看到的，Shell有一个丰富的控制和条件结构语句。我们需要学习一些Shell中内建的命令。这样我们就可以解决一些不会被编译器所看到的真正的程序问题。
<p id="TBPingURL">Trackback: http://tb.blog.csdn.net/TrackBack.aspx?PostId=661988</p>
