---
layout: post
title: Maximum sum of consecutive integers
tags:
- algorithm
- dynamic programming
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  _edit_last: '1'
  aktt_notify_twitter: 'no'
  _wp_old_slug: '1812'
  _efficient_related_posts: a:10:{i:0;a:4:{s:2:"ID";s:4:"1804";s:10:"post_title";s:32:"找钱问题--动态规划一例";s:7:"matches";s:1:"3";s:9:"permalink";s:91:"http://azaleasays.com/2011/02/16/coin-change-problem-an-application-of-dynamic-programming/";}i:1;a:4:{s:2:"ID";s:4:"1792";s:10:"post_title";s:30:"Cannot
    find python intepreter ";s:7:"matches";s:1:"1";s:9:"permalink";s:63:"http://azaleasays.com/2011/01/15/cannot-find-python-intepreter/";}i:2;a:4:{s:2:"ID";s:4:"1776";s:10:"post_title";s:42:"python判断字符串是否是回文结构";s:7:"matches";s:1:"1";s:9:"permalink";s:61:"http://azaleasays.com/2010/12/11/python-string-is-palindrome/";}i:3;a:4:{s:2:"ID";s:4:"1762";s:10:"post_title";s:50:"matplotlib绘图实例3：染色体直线示意图";s:7:"matches";s:1:"1";s:9:"permalink";s:74:"http://azaleasays.com/2010/12/02/matplotlib-example-lines-for-chromosomes/";}i:4;a:4:{s:2:"ID";s:4:"1715";s:10:"post_title";s:24:"Python菊花文转换器";s:7:"matches";s:1:"1";s:9:"permalink";s:90:"http://azaleasays.com/2010/10/11/python-converter-for-juhuaren-html-character-entity-1161/";}i:5;a:4:{s:2:"ID";s:4:"1687";s:10:"post_title";s:40:"Python保留list只出现一次的元素";s:7:"matches";s:1:"1";s:9:"permalink";s:76:"http://azaleasays.com/2010/08/30/python-keep-list-elements-that-appear-once/";}i:6;a:4:{s:2:"ID";s:4:"1420";s:10:"post_title";s:30:"用Python漂亮地打印序列";s:7:"matches";s:1:"1";s:9:"permalink";s:72:"http://azaleasays.com/2010/07/15/print-sequence-beatifully-using-python/";}i:7;a:4:{s:2:"ID";s:4:"1407";s:10:"post_title";s:25:"在Python中调用RNAfold";s:7:"matches";s:1:"1";s:9:"permalink";s:55:"http://azaleasays.com/2010/05/19/use-rnafold-in-python/";}i:8;a:4:{s:2:"ID";s:4:"1371";s:10:"post_title";s:36:"matplotlib绘图实例2：color
    mesh";s:7:"matches";s:1:"1";s:9:"permalink";s:63:"http://azaleasays.com/2010/04/29/matplotlib-example-color-mesh/";}i:9;a:4:{s:2:"ID";s:4:"1374";s:10:"post_title";s:38:"matplotlib绘图实例1：scatter
    plot";s:7:"matches";s:1:"1";s:9:"permalink";s:65:"http://azaleasays.com/2010/04/28/matplotlib-example-scatter-plot/";}}
  _relation_threshold: '1'
  original_post_id: '1812'
---
Problem: 
Given a list of N integers (both positive and negative), find the sub-sequence with the largest sum.

Solution:
<pre>#!/usr/bin/python

import random
import time

def f1(L):
    '''Method 1: O(n^3)
    Enumerate all possible combinations of index i and j,
    calculate the cumulative sum for every pair of i and j,
    return the maximum.
    '''
    N = len(L)
    smax = sum(L)
    for i in range(N):
        for j in range(i,N):
            s = sum(L[i:j+1])
            if s &gt; smax:
                smax = s
    return smax

def f2(L):
    '''Method 2: O(n^2)
    Calculate the cumulative sum of the first i elements csum,
    then the cumulative sum between i and j is csum[j] - csum[i],
    return the maximum.
    '''
    N = len(L)
    csum = [0]*N
    csum[0] = L[0]
    for i in range(1,N):
        csum[i] = csum[i-1] + L[i]
    smax = csum[0]
    for i in range(0,N):
      for j in range(i+1,N):
          s = csum[j] - csum[i]
          if s &gt; smax:
              smax = s
    return smax

def f3(L):
    '''Method 3: O(n)
    Dynamic programming.
    Let S[i] be the optimal solution including L[i],
    Then the optimal solution of the original problem 
    must lie in one of S.
    i.e.at least one of L[i] must be included in the final solution
    Return max(S)
    '''
    N = len(L)
    S = [0]*N
    S[0] = L[0]
    for i in range(1,N):
        S[i] = max(S[i-1]+L[i], L[i])
    return max(S)

N = 500
LIM = 1000
# Generate a random list of N integers ranging from -LIM to LIM
L = []
for i in range(N):
    L.append(random.randint(-LIM,LIM))

# Method 1: O(n^3)
time1 = time.time()
print f1(L)
time2 = time.time()
print 'Time used by Method1:', time2-time1

# Method 2: O(n^2)
time1 = time.time()
print f2(L)
time2 = time.time()
print 'Time used by Method2:', time2-time1

# Method 3: O(n)
time1 = time.time()
print f3(L)
time2 = time.time()
print 'Time used by Method3:', time2-time1</pre>
There is another solution in O(n log2 n) using Divide and Conquer <a href="http://www.fearme.com/misc/alg/node101.html" target="_blank">here</a>.

One related question <a href="http://stackoverflow.com/questions/4487438/maximum-sum-of-non-consecutive-elements" target="_blank">here</a>.

I look forward to improvement on the O(n) algorithm. :)
