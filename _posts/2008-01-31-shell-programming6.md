---
layout: post
title: Shell编程(六)—Here Documents与Dialog  zz
tags:
- linux
- Shell编程
- ubuntu
- zz
status: publish
type: post
published: true
meta:
  views: '808'
  _wp_old_slug: shell%e7%bc%96%e7%a8%8b%e5%85%ad-here-documents%e4%b8%8edialog
---
<a href="http://blog.csdn.net/mylxiaoyi/archive/2006/04/15/664268.aspx"> Shell编程(六)---Here Documents与Dialog</a>

<p class="postText">		Here Documents
从一个Shell脚本传递给一个命令的一个比较特殊的方法就是使用here document.这个文档可以使得执行的命令就像是由文件或是键盘读入的,而事实上,这是由这个脚本读入的.
一 个here document是以&lt;&lt;开头的,后面所跟的是要在文档的结尾处重复出现的字符序列.&lt;&lt;是Shell的重定向标签,在这样的情 况下,他会强制将命令输入给here document.这个特殊的序列的作用就像是一个标记,来告诉Shell here document要在哪里结束.这个标记充列不可以出现在要传递给命令的行上,所以最好是将他们标记为最不常用的或是难以忘记的内容.
如下面的这个例子:

<p class="postText"><!--more-->
#!/bin/sh
cat &lt;&lt;!FUNKY!
hello
this is a here
document
!FUNKY!
而这个脚本的输出如下:
hello
this is a here
document
here document看上去也许是一个古怪的特征,但是他们却是非常强大的,因为他可以允许我们调用一个交互的程序,如编辑器,而提供给他们一些预定义的输 入.然而他们最常用到的地方却是从一个脚本的内部输出大量的文本,正如我们在前面所看到的一样,从而可以避免在每一行使用echo命令.我们使用了!来标 记每一行的标记符以保证不会造成迷惑.
如果我们希望以一个预先定义好的方式来处理一个文件中的一些行,我们可以使用ed编辑器并且可以在一个Shell脚本中使用here document传递编辑的命令.
假如有一个名为a_text_file的文件,他包含下面的一些行:
That is line 1
That is line 2
That is line 3
That is line 4
我们可以用下面的这个脚本来进行处理:
#!/bin/sh
ed a_text_file &lt;&lt;!FunkyStuff!
3
d
.,$s/is/was/
w
q
!FunkyStuff!
exit 0
在我们运行这个脚本之后,这个文件的内容如下:
That is line 1
That is line 2
That was line 4
工作原理:
这 个Shell脚本只是简单的调用了ed编辑,然后将一些要执行的动作命令传递给ed编辑器,这些命令分别是移动到第三行,删除此行,然后在当前行使用 what was进行替换.ed命令是由当前脚本中的here document处取得的,也就是在!FunkyStuff!之间的部分.
在这里我们要注意的一点就我们使用了进行了$的转义.
调试脚本
调试脚本是一件非常容易的事情,但是却并没有其他的特殊的工具来帮助我们进行调试.在这里我们会概要的说明一些常用到的方法.
当发生错误时,Shell通常会打印出包含错误内容的行号.如果错误并没有立即是显示出来,我们可以添加另外的echo语句来显示变量的内容而且可以简单的输入交互Shell中进行代码片段的测试.
因为脚本是被解释的,所以修改和重试一个Shell时并没有编译的动作.跟踪更为复杂的错误的主要方法就是设置各种Shell选项.要这样做,我们可以在调用脚本后使用命令行选项或者是使用set命令.我们在这里列出一些常用到的选项:
命令行选项        set选项            描述
sh -n &lt;script&gt;        set -o noexec        只检查语法错误,并不执行命令
set -n
sh -v &lt;script&gt;        set -o verbose        在运行命令之前将命令打印出来
set -v
sh -x &lt;script&gt;        set -o xtrace        在命令执行之后将命令打印出来
set -x
set -o nounset        当使用未定义的变量时给出错误信息
set -u
我 们可以设置打开标记选项,使用-o,或是关闭,使用+o,这样就如同在使用缩写版本.我们可以使用xtrace选项进行简单的跟踪执行.作为最初的检查, 我们可以使用命令选项,但是在最后的测试时,我们可以在脚本中会出现的问题的代码中加入xtrace标记.执行跟踪会使得Shell在执行Shell脚本 中的每一行命令之前将变量的扩展等内容打印出来.
我们可以使用下面的命令来打开xtrace:
set -o xtrace
我们也可以用下面的命令来关闭xtrace:
set +o xtrace
扩展的层次在由每一行的开始的+的个数来表示的(默认情况下).我们可以将+改为一些更有意义的内容,方法是在我们的Shell配置文件中设置Shell变量PS4的值.
在Shell中,我们还会发现我们可以通过取得EXIT的信号来得到一个程序的状态.
trap ‘echo Exiting: critical variable = $critical_variable’ EXIT
进入图形---对话实用程序
在 结束我们的Shell脚本的讨论之前,我们还要讨论一个特征,虽然严格来说这并不是Shell的一部分,但是对于Shell程序来说却是相当有用的,所以 我们要在这里讨论一下.如果我们知道我们的脚本程序只在Linux文本下运行,我们可以有一个简洁的办法来加亮我们脚本的特色,那就是我们可以使用 dialog命令.这个命令会使用文本的模式和颜色,但是他看起来还是有着图形界面的色彩.
dialog是相当简单的,也只是一个有着各种参数及 变量的单一程序并且允许我们显示各种类型的图形框,所示的范围也只是有着Yes/No的来进行输入的方框甚至是菜单选择.这个程序通常会在用户进行了输入 分类时返回,返回的结果可以由返回的状态得到或者是通过取回标准错误流输入的文本.
在我们在开始更为详细的说明以前,我们先来看一个非常简单的dialog操作.我们可以直接在命令行使用dialog,这可以很好的来展示原型,所以我们先创建一个简单的消息框来显示传统的第一个程序:
dialog --msgbox “Hello World” 9 18
这样就会在屏幕上显示一个图形信息框,仅是一个OK对话框.
现在我们可以看到dialog是一件多么简单的事情.下面我们可以来看一些更为详细的选项:
下表列出我们可以创建的主要的对话框.
选择对话框    --checklist    允许我们显示一个列表项,其中的每一个都可以单独选择
信息对话框    --infobox    可以立即返回的简单对话框,返回后并不会清除屏幕
输入对话框    --inputbox    允许用户输入文本
菜单对话框    --menu        允许用户从列表项中进行单一选择
信息对话框    --msgbox    向用户显示一个有着Ok按钮的信息框
单选对话框    --raidolist    允许用户从列表中选择一项
文本对话框    --textbox    允计我们在一个滚动框中显示一个文件
Yes/No对话框    --yesno        允许我们询问一个问题,可以允许用户选择yes或是no
另外还有一些其他的对话框类型可以用.如果我们想要知道更多的一些不常用的对话框,如以前一样,我们可以从手册页可得到更为详细的内容说明.
要 得到任何一个允许我们进行文本输入的对话框的输出或是选择,我们需要得到错误流,通常情况下我们是将他们重定向一个临时文件,这样我们就可以在稍后进行处 理了.要得到Yes/No类型的结果,我们只需要查看一下返回代码就可以了,与其他的程序相类似,成功则返回0(例如yes选择),失败则返回1.
--checklist    text height width list-height [tag text status] ...
--infobox    text height width
--inputbox    text height width [initial string]
--menu        text height width menu-height [tag item ] ...
--msgbox    text height width
--radiolist    text height width list-height [tag text status] ...
--textbox    filename height width
--yesno        text height width
另外,所有的对话框都会带一些选项.我们在这里不会列出所有的选项,但是我们却要注意其听两个:--title,允许我们为对话框指定一个标题,--clear,用来清屏.我们可以通地查看手册页得到更为详细的内容.
下 面我们开始一个简单的完整的例子.一旦我们懂得了这个例子,那么所有其他的也只就是一件简单的事了.这个例子子会创建一个选择列表类型的对话框,标题为 Check me,而说明为Pick Numbers.这个列表对话将会是15个字符高和25个字符宽,而每一个选项为3个字符高.最后我们显示出这些内容,并且在设置了默认情况下的开关选 项.
dialog --title “Check me” --checklist “Pick Numbers” 15 25 3 1 “one” “off” 2 “two”“on” 3 “three” “off”
工作原理:
在这个例子中,--checklist的参数告诉我们要创建一个checklist类型的对话框.我们使用--title选项将这个对话框的标题设置为Check me,而下一个参数则是提示的信息,在这里我们将其设为Pick Numbers.
我们接下来的操作是来设置对话框的大小.我们在这里将其设成15行高和25行宽,另外有将有3行用来显示菜单.这并不是一个很好的尺寸,但是在这里却很好的向我们显示了如何来进行布局.
也许这样的选项看上去实在是有一些太奇怪了,但是我们所要记住的只是每一个菜单选项有三个值:
标号,文本以及状态.
所以第一个项目的标号我们设为1,而显示的文本为"one"并且状态为"on".我们可以依此设置以后的各个选项.
很容易是不是?我们只要在命令行上试验一些命令我们就可以看到这个命令是如何容易的来使用了.
为了将这样的对话框放在一个程序中,我们需要能够访问用户输入的结果.这也是相当容易的,我们只要简单的文本输入重定向错误流或者是检查环境变量$?,这也就是我们在前面的命令行中所调用的返回状态.
如下面的这个例子:
#!/bin/sh
# Ask some questions and collect the answer
dialog --title “Questionnaire” --msgbox “Welcome to my simple survey” 9 18
在这里我们只是通过一个简单的对话框显示来告诉用户发生了什么.而我们并不需要得到用户输入的结果,所以这是相当简单的.
我们可以将这个程序加以改进:
dialog --title “Confirm” --yesno “Are you willing to take part?” 9 18
if [ $? != 0 ]; then
dialog --infobox “Thank you anyway” 5 20
sleep 2
dialog --clear
exit 0
fi
现在我们通过使用一个简单的yes/no对话框来询问用户是否要进行处理.我们使用环境变量$?来检测用户是否选择了yes或是no.如果用户不希望进行处理,我们就会在退出之前使用一个简单的不需要用户有输入的信息对话框.
dialog --title “Questionnaire” --inputbox “Please enter your name” 9 30 2&gt;_1.txt
Q_NAME=$(cat _1.txt)
现在我们使用一个输入对话框来询问用户的姓名.我们重定向标准错误流2到一个临时文件,_1.txt,这样我们就可以用变量Q_NAME来进行处理了.
dialog --menu “$Q_NAME, what music do you like best?” 15 30 4 1 “Classical” 2
“Jazz” 3 “Country” 4 “Other” 2&gt;_1.txt
Q_MUSIC=$(cat _1.txt)
现在我们显示了一个有着四个不同选项的菜单.在这里我们也将重定向标准错误流到一个临时文件并装入到一个变量中.
if [ “$Q_MUSIC” == “1” ]; then
dialog --msgbox “Good choice!” 12 25
fi
如果用户选择了菜单选项1,这就会被存放在一个临时文件_1.txt中,这样我们可以将结果取出放在一个变量Q_MUSIC中,从而我们可以检测结果.
sleep 5
dialog --clear
exit 0
最后我们清除最后一个对话框并退出程序.
现在如果我们只需要使用Linux文本界面,从一个Shell脚本编写简单的GUI程序,我们就可以使用这样的方法.
组合
现在我们已经看到将Shell做为一门编程语言所具有的主要特征,现在我们可以将我们已经学到的这些内容组合在一起来编写一个简单的程序.
<p id="TBPingURL">Trackback: http://tb.blog.csdn.net/TrackBack.aspx?PostId=664268</p>
