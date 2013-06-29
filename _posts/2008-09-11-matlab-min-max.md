---
layout: post
title: 用Matlab求函数的最大值和最小值 转载
tags:
- programming
status: private
type: post
published: false
meta:
  _edit_last: '1'
  original_post_id: '1888'
  _wp_old_slug: '1888'
---
<a href="http://bbs.matwav.com/post/view?bid=12&amp;id=334948&amp;sty=3">http://bbs.matwav.com/post/view?bid=12&amp;id=334948&amp;sty=3</a>

（1） 无约束条件的极值

x=fminunc(‘f(x)’,x0,options)
求函数f(x)的极小值点。其中x0为极小值点的猜测值，x、x0可以是标量、向量或矩阵；options为参数说明语句。

[x,fval]=fminunc(‘f(x)’,x0,options)
返回的x为极小值点，fval为函数的极小值

注：①Matlab没有提供求极大值的命令。要求函数f(x)的极大值点，只需求函数-f(x)的极小值点。-f(x)的极小值的相反

数就是f(x)的极大值。

② fminunc(‘f(x)’,x0,options)的局限性

1． 只能处理实数函数的优化问题。

2． 目标函数必须是连续的。

3． 给出的可能只是局部解。

（2）有约束条件的极值

x=fmincon(‘f(x)’,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
f(x)为需要优化的目标函数，x0 为变量的估计初值，x、x0可以是标量、向量或矩阵, options为参数说明语句。

A,b,Aeq,beq,lb,ub,nonlcon为优化的约束条件。

[x,fval]=fmincon(‘f(x)’,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
返回的x为极小值点，fval为函数的极小值

注：

①优化的约束条件

A,b

（线性不等式约束）
Aeq,beq

（线性等式约束）
lb,ub

（边界约束）
nonlcon

A*x
A=[], B=[]
lb≤x≤ub

非线性的不等式和等式约束

在表达约束条件时，默认为线性不等式约束，线性等式约束，边界约束，非线性不等式约束和非线性等式约束在形式

上按顺序同时存在于命令函数声明约束的位置上。如果某种约束不存在，则以空向量表示。不等式约束在形式上是一

个函数表达式，系统默认为其小于或等于0，等式约束在形式上也是一个函数表达式，系统默认为其等于0。这样就需

要把待求问题的约束条件转化为小于0或等于0的形式。

② fmincon(‘f(x)’,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)的局限性

1． 目标函数和约束函数必须为实数函数，不能为复数函数。

2． 目标函数和约束函数必须是连续的。

3． 给出的可能只是局部解。
