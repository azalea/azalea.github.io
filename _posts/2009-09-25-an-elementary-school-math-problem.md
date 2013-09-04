---
layout: post
title: 一道小学数学题
tags:
- math
- programming
- puzzle
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
  views: '579'
---
在<a href="http://groups.google.com/group/pongba/browse_thread/thread/3cc8d8891eba0660/dd5811392667dbdd" target="_blank">Top Languange</a>上看到：

> 同事儿子的作业，大概意思是这样:
> 
> 1 1 1 1
> 1 1 1 1
> 1 1 1 1
> 1 1 1 1
> 
> 4*4,把其中6个1替换成0,使得横竖1的个数都是偶数,一共有几种，并打印出来

偶用的穷举法，答案是96。  以下是Python代码：

```python
N = 4

def int2b(n, bit=N*N):
    return [(n &gt;&gt; i) &amp; 1 for i in range(bit)[::-1]]

def check(L):
    for i in range(N):
        if sum(L[i::N]) % 2 or sum(L[i*N:i*N+N]) % 2:
            return 0
    return 1

count = 0
for i in xrange(1&lt;&lt;N*N):
    L = int2b(i)
    if sum(L) == 10 and check(L):
        print 'n'.join([' '.join(map(str,L)[i::N]) for i in range (N)])
        print '-------'
        count += 1
print count
```

看到有人写的Python代码只要300多字符，我写的为啥要400+，伤心了。。
