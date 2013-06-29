---
layout: post
title: 用Python漂亮地打印序列
tags:
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '145'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
---
看到实验室的Cathy同学辛勤地手动给DNA序列加空格（每10个核苷酸加一个），花了一分钟帮她写了段代码：
<pre>step = 10  # Number of nucleotides in a group
group = 5  # Number of groups in a line

seq = 'NNNNNNNNNNNANNGTCTTGTGAGANTCCTGCAGTGGCTTGCTGAATTGGATCCCCACCGTACTCGTCAATT'

count = 0
for i in range(0,len(seq),step):
    count += 1
    print seq[i:i+step],
    if count == group:
        print
        count = 0
</pre>
输出：
NNNNNNNNNN NANNGTCTTG TGAGANTCCT GCAGTGGCTT GCTGAATTGG
ATCCCCACCG TACTCGTCAA TT

纯属灌水，以上。
