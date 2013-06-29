---
layout: post
title: Python module相关
tags:
- module
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '504'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
---
随便写写Python module怎么创建怎么用，详细解释请看 <a href="http://docs.python.org/tutorial/modules.html" target="_blank">The Python Tutorial -&gt; Modules</a>
顺便推荐下Istvan牛开的Python课程：<a href="http://www.personal.psu.edu/iua1/course/2009/bmmb-597D-2009.html" target="_blank">Practical Data Analysis for Life Scientists</a>

-----

我创建一个python文件，叫做 example.py:
<pre>"This module is just an example."

def printHello():
    "This function prints the most famous sentence in programming."
    print "Hello, world!"</pre>
然后保存到 "/home/azalea/Desktop"

进入Python shell

#改变当前工作目录到example.py保存的目录，这样暂时你就不用考虑如何把module加入系统路径了：
&gt;&gt;&gt; <span style="color:#3366ff;">import os</span>
&gt;&gt;&gt; <span style="color:#3366ff;">os.chdir('/home/azalea/Desktop')</span>

#导入example.py，此时这个文件就被python认为是个module
&gt;&gt;&gt; <span style="color:#3366ff;">import example</span>

#调用在example.py里定义的函数 printHello()
&gt;&gt;&gt; <span style="color:#3366ff;">example.printHello()</span>
Hello, world!

#查看module的名字，这里自然就是example了
&gt;&gt;&gt; <span style="color:#3366ff;">example.__name__</span>
'example'

#查看module的文档，显示的就是example.py文件最上面的字符串，称为Docstring，即 documentation string.
&gt;&gt;&gt; <span style="color:#3366ff;">example.__doc__</span>
'This module is just an example.'

#查看module的原始文件的路径，这里就是当前目录下的example.py （因为前面我们把当前工作目录改了, remember? ）
&gt;&gt;&gt;<span style="color:#3366ff;"> example.__file__</span>
'example.py'

#列出module的所有可用函数
&gt;&gt;&gt;<span style="color:#3366ff;"> dir(example)</span>
['__builtins__', '__doc__', '__file__', '__name__', '__package__', 'printHello']

#显示example module里的printHello函数的文档，就是printHello函数最前面的字符串，同样也是Docstring。
&gt;&gt;&gt; <span style="color:#3366ff;">example.printHello.__doc__</span>
'This function prints the most famous sentence in programming.'

#查看example module的帮助文件：
&gt;&gt;&gt; <span style="color:#3366ff;">help(example)</span>

你看到的就是
<blockquote>Help on module example:

NAME
example - This module is just an example.

FILE
/home/azalea/Desktop/example.py

FUNCTIONS
printHello()
This function prints the most famous sentence in programming.</blockquote>
#本质上，上面的帮助就是格式化的显示了 example.__name__, example.__doc__, example.__file__, ...而已

#如果你觉得通过example.printHello()来调用函数很罗嗦，你可以直接导入example module下的函数，语法是 <span style="color:#3366ff;">from <em>module </em>import <em>function</em></span>
#如果你用<span style="color:#3366ff;"> from <em>module </em>import *</span> 那么就是一次导入此module下的所有函数：
&gt;&gt;&gt; <span style="color:#3366ff;">from example import *</span>

#这样调用函数就简洁了：
&gt;&gt;&gt; <span style="color:#3366ff;">printHello()</span>
Hello, world!

#查看函数的文档也是同样：
&gt;&gt;&gt; <span style="color:#3366ff;">printHello.__doc__</span>
'This function prints the most famous sentence in programming.'

#不过这样带来一个问题，就是如果你导入了很多不同的module，而这些module里可能有重名的函数，那么可以这样查看函数属于哪个module：
&gt;&gt;&gt; <span style="color:#3366ff;">printHello.__module__</span>
'example'

#总结，我觉得python的自省功能还是很赞的（自省就是说一个module知道自己从哪里来，自己包含哪些函数，一个函数也知道自己来自哪个module），不知道其他语言有没有，大家留言指教下哈。
