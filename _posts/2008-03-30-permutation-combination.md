---
layout: post
title: 排列组合错排问题
tags:
- math
- whatever
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '989'
  _wp_old_slug: '%e6%8e%92%e5%88%97%e7%bb%84%e5%90%88%e9%94%99%e6%8e%92%e9%97%ae%e9%a2%98'
---
pala提出的问题: 十本不同的书放在书架上。现重新摆放，使每本书都不在原来放的位置。有几种摆法？

这个问题推广一下，就是错排问题: n个有序的元素应有n！种不同的排列。如若一个排列式的所有的元素都不在原来的位置上，则称这个排列为错排。

下面用递推的方法推导错排公式:

当n个编号元素放在n个编号位置,元素编号与位置编号各不对应的方法数用M(n)表示,那么M(n-1)就表示n-1个编号元素放在n-1个编号位置,各不对应的方法数,其它类推.
第一步,把第n个元素放在一个位置,比如位置k,一共有n-1种方法;
第二步,放编号为k的元素,这时有两种情况.1,把它放到位置n,那么,对于剩下的n-2个元素,就有M(n-2)种方法;2,不把它放到位置n,这时,对于这n-1个元素,有M(n-1)种方法;
综上得到
M(n)=(n-1)[M(n-2)+M(n-1)]
特殊地，M(1)=0,M(2)=1

下面通过这个递推关系推导通项公式:
为方便起见，设M(k)=k!N(k), (k=1,2,...,n)
则N(1)=0,N(2)=1/2
n&gt;=3时,n!N(n)=(n-1)(n-1)!N(n-1)+(n-1)!N(n-2)
即 nN(n)=(n-1)N(n-1)+N(n-2)
于是有N(n)-N(n-1)=-[N(n-1)-N(n-2)]/n=(-1/n)[-1/(n-1)][-1/(n-2)]...(-1/3)[N(2)-N(1)]=(-1)^n/n!
因此
N(n-1)-N(n-2)=(-1)^(n-1)/(n-1)!
.
.
.
N(2)-N(1)=(-1)^2/2!
相加，可得
N(n)=(-1)^2/2!+...+(-1)^(n-1)/(n-1)!+(-1)^n/n!
因此
M(n)=n![(-1)^2/2!+...+(-1)^(n-1)/(n-1)!+(-1)^n/n!]
可以得到
错排公式为M(n)=n!(1/2!-1/3!+.....+(-1)^n/n!)

此外也可以用容斥原理证明:
正整数1、2、3、……、n的全排列有n!种，其中第k位是k的排列有（n-1)!，当k取1、2、3、……、n时，共有n*（n-1)!种排列，由于是错排，这些排列应排除，但是此时把同时有两个数不错排的排列多排除了一次，应补上；在补上时，把同时有三个数不错排的排列多补上了一次，应排除；……；继续这一过程，得到错排的排列种数为
M(n)=n!-n!/1!+n!/2!-n!/3!+...+(-1)^n*n!/n!=sigma(k=2~n) (-1)^k*n!/k!
注:sigma表示连加符号,(k=2~n)是连加的范围

References:
<a href="http://www.wzms.com/resource/showresource.asp?resourceid=4930" target="_blank"> http://www.wzms.com/resource/showresource.asp?resourceid=4930</a>
<a href="http://zhidao.baidu.com/question/44220309.html" target="_blank"> http://zhidao.baidu.com/question/44220309.html</a>
<a href="http://zhidao.baidu.com/question/49742299.html" target="_blank"> http://zhidao.baidu.com/question/49742299.html</a>
<a href="http://baike.baidu.com/view/668994.htm" target="_blank"> http://baike.baidu.com/view/668994.htm</a>
