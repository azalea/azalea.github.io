---
layout: post
title: Shell编程(一)—为什么使用Shell编程 zz
tags:
- linux
- Shell编程
- ubuntu
- zz
status: publish
type: post
published: true
meta:
  views: '685'
  _wp_old_slug: shell%e7%bc%96%e7%a8%8b%e4%b8%80-%e4%b8%ba%e4%bb%80%e4%b9%88%e4%bd%bf%e7%94%a8shell%e7%bc%96%e7%a8%8b-zz
---
<a href="http://blog.csdn.net/mylxiaoyi/archive/2006/04/12/661085.aspx"> Shell编程(一)---为什么使用Shell编程</a>

为什么要使用Shell编程?
Linux操作系统是由UNIX操作系统发展起来的.UNIX操作系统中所体现出来的思想和哲学深沉的影响了现 代其他的操作统.在UNIX系统中提供了许多不同的Shell程序.大多数的商业UNIX提供了Korn Shell,当然了我们也还有其他的Shell可以来用.虽然Shell看起来与Windows的命令行相类似,但是他显得更为的强大,可以以他的方式来 运行更为复杂的程序.我们可以使用Shell进行更为快速和简单的编辑.另外在大多数的Linux基系统的安装提供了Shell,所以我们可能很方便的来 检测我们的工作是否可以正常的进行工作.而且Shell可以提供许多的实用程序,我们可以用这样的内容来很好的进行我们的工作,而且这样的程序易于维护和移植.

<!--more-->
一些哲学:
现在我们来认识一下UNIX和Linux哲学.UNIX是建立在代码高度重用的基础上的.我们可以建立一个简单的实用程序,那么其他的人就可以用字符串链接或是其他的形式来使用我们的程序.Linux的一大优点就是提供了许多优秀的工具.如:
$ ls -al | more
这个命令使用了ls和more命令,而且使用了管道来重定向输出.我们可以使用简单的脚本来创建立大的复杂的程序.
例如,如果我们要打印bash的man手册页我们可以用下面的命令:
$ man bash | col -b | lpr
因为Linux的自动文件处理,这些程序的使用者一般并不要知道这些程序是以哪种语言写成的.
管道和重定向:
在我们详细的说明Shell编程之前,我们先来说明一下Linux的程序(不仅是Shell程序)如何来重定向输入和输出.
重定向输出:
也许我们已经对输出重定向较为熟悉了.如:
$ ls -l &gt; lsoutput.txt
这个命令会将ls命令的输出保存期在一个名为lsoutput.txt的文件中.
然而事实上要有比我们在这个例子中显示的还要多的重定向.现在我们要知道的就是文件修饰0是程序的标准的输入,1为标准输出,2为标准的错误输出.我们可以独立的重定向这些中的任何一个.事实上我们也可以重定向其他的文件修饰,但是一般的情况下为0,1,2.
在上面的这个例子中,我们使用&gt;修饰符来重定向标准输出到一个文件.在默认的情况,如果这个文件已经存在了,他就会被重写.
如果要增加文件内容,我们可以使用&gt;&gt;运算符.如:
$ ps &gt;&gt; lsoutput.txt
这个就会在文件后面增加新的输出内容.
如果要重定向标准错误输出,我们可以使用&gt;运算符和我们要使用的文件修饰符来进行重定向.因为标准的错误输出修饰符为2,我们就可以使用2&gt;运算符.这在忽略错误信息而又不显示在屏幕上时就会显得尤为有用.
假 如我们要在脚本中使用kill命令来杀掉一个进程,然而却是常用这样的情况,在这个命令运行之前这个进程已经不存在了.如果是这样的情况,kill命令就 会产生一个标准的错误输出,而在默认的情况下,这个输出要显示在屏幕上.通过重定向输出和错误,我们就可以阻止在屏幕上显示任何内容.如下面的命令:
$ kill -HUP 1234 &gt;killout.txt 2&gt;killerr.txt
这个命令就会将输出和错误信息存放在一个单独的文件中.
如果我们要将这两个输出放在一个文件中,我们可以使用&gt;&amp;来组合这两种输出.如:
$ kill -1 1234 &gt;killouterr.txt 2&gt;&amp;1
这个命令就可以将所有的输出放在同一个文件中.在这里我们要注意的就是命令的顺序.这个命令的顺序可以解释为重定向标准输出到文件killouterr.然后重定向标准错误输出到与标准输出同一的地方.如果我们弄错了顺序,我们就不会得到我们希望的输出.
在这里我们会看到kill命令的结果使用了返回代码,然而常常是我们并不需要保存标准输出或是标准错误输出.我们可以使用UNIX中的/dev/null来忽略所有的错误输出.如:
$ kill -1 1234 &gt;/dev/null 2&gt;&amp;1
重定向输入:
与重定向输出相类似,我们也可以重定向输入.如:
$ more &lt; killout.txt
管道:
我们可以使用管道符|来连接进程.在Linux系统中,由管道连接起来的进程可以自动运行,就如同在他们有一个数据流一样.在下面的这个例子中,我们要使用sort命令来排序ps的输出.而如果我们不使用管道,我们就要分几步来完成:
$ ps &gt; psout.txt
$ sort psout.txt &gt;pssort.out
一个更好的办法就是可以用管道来处理:
$ ps | sort &gt; pssort.out
因为我们要在屏幕上看到他们,我们要使用第三个进程:
$ ps | sort | more
使用的管道数并没有一个量的限制.如果我们要看到正在运行的除了shell以外的不同名字的进程,我们可以用下面的命令:
$ ps -xo comm | sort | uniq | grep -v sh | more
在这个命令中,使用了ps的输出,将这个输出以字母的顺序进行排序,使用uniq来解压进程,使用grep -v sh来移除名为sh的进程,最后在屏幕上显示结果.
在这里我们就可以看到,这样的方式式要比单个执行的命令好得多.在这里我们要注意的一点点就是,在这个命令中我们不要两次使用同一个文件.如下面的命令:
$ cat mydate.txt | sort | uniq | &gt;mydate.txt
这样我们就会得到一个空文件,因为在我们读取这个之前已经改写了这个文件.
Shell作为编程语言:
现在我们已经知道了一些基本的Shell操作,下面我们就进入脚本编程.有两种写Shell程序的方法:我们可以输入命令队列,让Shell来交互的执行他们,或者是将这些命令存放在一个文件中,然后作为程序进行调用.
交互程序:
在命令行输入脚本是可以快速方便的试出小的代码段,如果我们正在学习或是进行测试这是一个相当好的方式.假如我们有许多的C文件,而我们希望找出其中含有POSIX字符串的文件.我们可以如下面的样子进行整体的操作:
$ for file in *
&gt; do
&gt; if grep -l POSIX $file
&gt; then
&gt; more $file
&gt; fi
&gt; done
在这里我们就会看到Shell提示符由$变成了&gt;.我们可以输入命令由Shell来决定如何时停止并且立即执行脚本程序.
在这个例子中,grep命令查找其中含有POSIX字符串的文件,然后more将这个文件中的内容打印在屏幕上.最后Shell返回提示符.
Shell 也会允许我们使用通配符进行扩展.我们可以使用*来匹配字符串,我们还可以使用?来匹配单个的字符,而[set]可以允许检测在这里列出的任何一个单个字 符.[^set]则正好相反,要除去在这里所列出的字符.我们还可以使用花括号{}进行扩展,这可以允许我们将任意的字符串放在一起.如下面的例子:
$ ls my_{finger,toe}s
这个命令会列出文件my_fingers,my_toes.
有经验的用户也许会用一种更有效率的方式来运行这些命令.也许我们会使用下面的命令:
$ more `grep -l POSIX *`
或者是下面的命令:
$ more $(grep -l POSIX *)
$ grep -l POSIX * | more
这些命令都会打印出含有POSIX的文件名.
然而事实上如果我们每一次要完成这样的任务就要输入一系列命令的做法是相当麻烦的一件事.我们需要就是将这些命令放在一个文件中,作为一个Shell脚本来引用,这样就可以在我们需要的时候来运行他了.
创建一个脚本:
首先我们可以使用任何一个我们喜欢的文本编辑来创建一个含有下面命令的文件,命名为first:
#!/bin/bash
#  first
#  This file looks through all the files in the current
#  directory for the string POSIX, and then prints the names of
#  those files to the standard output.
for file in *
do
if grep -q POSIX $file
then
echo $file
fi
done
exit 0
在 这个文件中以#开始的行被看作是注释,在通常的情况下,我们会将#放在第一列.在这里我们要注意的是第一行的注释,#!  /bash/bash是一个特殊格式的注释.#!后面的字符告诉系统我们要执行这个文件的程序.在当前的情况下,/bin/bash是默认的Shell程 序.
在这里指定的绝对路径最好的做法就是要少于32个字符,因为在一些老版本的UNIX系统有着这样的限制,我们这样做可以很好的做到向后兼容.
因为这个脚本被看作是标准的Shell输入,所以可以包含任何的Linux命令.
exit 命令可以返回一个较为敏感的退出代码.如果这个程序是单独运行的,我们就没有必要来检测这个程序的返回代码,而如果我们要在另一个程序中进行调用,进行返 回代码的检测以确定这个程序是否成功执行就显得尤为重要.虽然有时我们并不希望我们的程序被其他的程序调用,我们也要返回一个合理的代码.因为也许有一天 我们的程序就会作为其他脚本的一部分而被重用.
0则表明这个程序成功执行.因为脚本并不会检测任何的失败,所以我们总是返回成功代码.
我 们要注意的另外一点就是在这个文件中我们并没有使用任何的扩展名或是前缀.在Linux或是UNIX系统中并不依靠文件的扩展名来判断文件的类型.如果我 们希望可以为这个文件加一个.sh或是其他的扩展名,但是Shell并不会在意这些.大多数预先安装的脚本并没有扩展名,而最好的用来检测文件类型的办法 就是使用file命令.
使用脚本可执行:
现在我们就有了我们的脚本程序,我们可以用两种方式来运行.最简单的办法就是将脚本文件作为参数使用Shell进行调用:
$ /bin/bash first
这样就可以正常的工作了.如果我们可以将其与其他的Linux命令相分离而是直接输入命令文件名就可以运行这个程序就显得更好一些.如果我们要这样的做,我们首先要使用下面的命令来为他加上可执行属性:
$ chmod +x first
现在我们就可以用下面的命令来运行了:
$ ./first
Trackback: http://tb.blog.csdn.net/TrackBack.aspx?PostId=661085