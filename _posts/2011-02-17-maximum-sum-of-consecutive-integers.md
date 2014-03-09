---
layout: post
title: Maximum sum of consecutive integers
tags:
- algorithm
- dynamic programming
- programming
- python
language: en
---
Problem: 
Given a list of N integers (both positive and negative), find the sub-sequence with the largest sum.

Solution:

```python
#!/usr/bin/python

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
```

There is another solution in O(n log2 n) using Divide and Conquer <a href="http://www.fearme.com/misc/alg/node101.html" target="_blank">here</a>.

One related question <a href="http://stackoverflow.com/questions/4487438/maximum-sum-of-non-consecutive-elements" target="_blank">here</a>.

I look forward to improvement on the O(n) algorithm. :)
