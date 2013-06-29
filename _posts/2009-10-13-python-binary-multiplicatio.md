---
layout: post
title: Python二进制乘法
tags:
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '432'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
---
今天无聊，在百度知道上看到<a href="http://zhidao.baidu.com/question/121216063.htm" target="_blank">这个问题</a>：
<blockquote><strong>Python里怎么样用二进制来做乘法</strong>
2个数字，先转换成二进制的2个list，然后用这两个list来做乘法，最后转换回数字</blockquote>
于是无比无聊的解答了一下，下面是代码：
<pre>N = 32  #the number of bits for an integer

def int2b(n, bit=N):
    return [(n &gt;&gt; i) &amp; 1 for i in range(bit)[::-1]]

def b_add(l1, l2, bit=N):
    result = [0]*N
    carry = 0
    for i in range(N)[::-1]:
        half_sum = l1[i] ^ l2[i]
        b_sum =  (half_sum ^ carry)
        half_carry = (l1[i] &amp; l2[i])
        carry = (carry &amp; half_sum) | half_carry
        result[i] = b_sum
    return result

def b_multiply(l1, l2, bit=N):
    result = [0]*N
    for i in range(N):
        if l2[i]:
           result = b_add(result[:],l1[N-i-1:]+[0]*(N-i-1))
    return result

def b2int(l, bit=N):
    result = 0
    for i in range(bit):
        if l[i]:
            result += (l[i]&lt;&lt;(N-i-1))
    return result

def main(x, y):
    print b2int(b_multiply(int2b(x), int2b(y)))

if __name__ == '__main__':
    main(5,7)</pre>
此代码只用于无符号整数，且没有考虑溢出问题，如果大家有更好的方法，<del datetime="2009-10-13T07:08:17+00:00">可以到<a href="http://zhidao.baidu.com/question/121216063.htm" target="_blank">原帖</a>回答一下，有赏金80块。。</del>原帖已关闭=.=! 大家留言好了
