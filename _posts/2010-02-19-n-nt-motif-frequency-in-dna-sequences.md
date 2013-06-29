---
layout: post
title: Python统计DNA序列中长度为n的子序列频率
tags:
- bioinformatics
- fun
- gossip
- programming
- python
- seqence
- zz
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '493'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
---
ms是我师弟的rotation project：
给定一堆DNA序列，即由字符A, C, G, T组成的字符串，统计所有长度为n的子序列出现的频率。
比如 ACGTACGT，子序列长度为2，于是 AC=2, CG=2, GT=2, TA=1，其余长度为2的子序列频率为0.

最先想到的就是建一个字典，key是所有可能的子序列，value是这个子序列出现的频率。
但是当子序列比较长的时候，比如 n=8，需要一个有65536 (4的8次方) 个key-value pair的字典，且每个key的长度是8字符。这样ms有点浪费内存。。

于是想到，所有的长度为n的子序列是有序且连续的，所以可以映射到一个长度为4的n次方的的list里。
令 A=0, C=1, G=2, T=3，则把子序列 ACGT 转换成 0*4^3 + 1*4^2 + 2*4 + 3 = 27, 映射到list的第27位。
如此，list的index对应子序列，而list这个index位置则储存这个子序列出现的频率。

于是我们先要建立2个字典，表示ACGT和0123一一对应的关系：

<pre>
i2mD = {0:'A', 1:'C', 2:'G', 3:'T'}
m2iD = dict(A=0,C=1,G=2,T=3)
# This is just another way to initialize a dictionary
</pre>

以及下面的子序列映射成整数函数：

<pre>
def motif2int(motif):
    '''convert a sub-sequence/motif to a non-negative integer'''
    total = 0
    for i, letter in enumerate(motif):
        total += m2iD[letter]*4**(len(motif)-i-1)
    return total
</pre>

Test:

<pre>
&gt;&gt;&gt; motif2int('ACGT')
27
</pre>

虽然我们内部把子序列当成正整数来存储（确切地说，其实这个整数是没有存在内存里的，而是由其在list的index表示的），为了方便生物学家们看，输出时还是转换回子序列比较好。

于是有了下面的整数映射成子序列函数，其中调用了另外一个函数baseN()，<a href="http://code.activestate.com/recipes/65212/">来源在此</a>，感谢作者～

<pre>
def baseN(n,b):
    '''convert non-negative decimal integer n to
    equivalent in another base b (2-36)'''
    return ((n == 0) and  '0' ) or ( baseN(n // b, b).lstrip('0') + 
    "0123456789abcdefghijklmnopqrstuvwxyz"[n % b])

def int2motif(n, motifLen):
    '''convert non-negative integer n to a sub-sequence/motif with length motifLen'''
    intBase4 = baseN(n,4)
    return ''.join(map(lambda x: i2mD[int(x)],'0'*(motifLen-len(intBase4))+intBase4))
</pre>

Test:

<pre>
&gt;&gt;&gt; int2motif(27,4)
'ACGT'
</pre>

以下代码从命令行读入一个存有DNA序列的<a href="http://en.wikipedia.org/wiki/FASTA_format">fasta文件</a>，以及子序列长度，并输出子序列和频率。注意以下代码需要<a href="http://biopython.org/wiki/Main_Page">Biopython</a> module。

<pre>
if __name__ == '__main__':
    import sys
    from Bio import SeqIO

    # read in the fasta file name and motif length
    # from command line parameters
    fastafile = sys.argv[1]
    motifLen = int(sys.argv[2])

    # list to store subsequence frequency
    frequencyL = [0]*4**motifLen

    # go over each DNA sequence in the fasta file
    # and count the frequency of subsequences
    it = SeqIO.parse(open(fastafile),'fasta')
    for rec in it:
        chrom = rec.seq.tostring()
        for i in range(len(chrom)-motifLen+1):
            motif = chrom[i:i+motifLen]
            frequencyL[motif2int(motif)] += 1

    # print frequency result to screen
    for i, frequency in enumerate(frequencyL):
        print int2motif(i, motifLen), frequency
</pre>

<a href="http://dl.dropbox.com/u/308058/blog/2010/test.fa">测试文件</a> <a href="http://dl.dropbox.com/u/308058/blog/2010/frequency.py">python源代码</a>

可以在终端输入

python frequency.py test.fa 2

则会输出：
AA 0
AC 0
AG 0
AT 4
CA 2
CC 1
CG 0
CT 0
GA 0
GC 4
GG 0
GT 0
TA 0
TC 0
TG 4
TT 0
