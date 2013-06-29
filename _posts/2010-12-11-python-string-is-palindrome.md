---
layout: post
title: python判断字符串是否是回文结构
tags:
- bioinformatics
- programming
- python
- string
status: publish
type: post
published: true
meta:
  _searchme: '1'
  aktt_notify_twitter: 'no'
  _edit_last: '1'
  _efficient_related_posts: 'a:10:{i:0;a:4:{s:2:"ID";s:4:"1313";s:10:"post_title";s:52:"Python统计DNA序列中长度为n的子序列频率";s:7:"matches";s:1:"2";s:9:"permalink";s:71:"http://azaleasays.com/2010/02/19/n-nt-motif-frequency-in-dna-sequences/";}i:1;a:4:{s:2:"ID";s:4:"1070";s:10:"post_title";s:58:"Python:
    去掉字符串中的非数字(或非字母)字符";s:7:"matches";s:1:"2";s:9:"permalink";s:69:"http://azaleasays.com/2009/09/05/python-strip-non-numeric-characters/";}i:2;a:4:{s:2:"ID";s:4:"1032";s:10:"post_title";s:51:"python:
    find repeat masked intervals in fasta files";s:7:"matches";s:1:"2";s:9:"permalink";s:84:"http://azaleasays.com/2009/08/10/python-find-repeat-masked-intervals-in-fasta-files/";}i:3;a:4:{s:2:"ID";s:3:"378";s:10:"post_title";s:26:"Reverse
    a string in python";s:7:"matches";s:1:"2";s:9:"permalink";s:60:"http://azaleasays.com/2008/08/26/reverse-a-string-in-python/";}i:4;a:4:{s:2:"ID";s:3:"363";s:10:"post_title";s:60:"使用python进行ClustalW格式和aligned
    FASTA格式转换";s:7:"matches";s:1:"2";s:9:"permalink";s:93:"http://azaleasays.com/2008/06/05/clutalw-format-aligned-fasta-format-conversion-using-python/";}i:5;a:4:{s:2:"ID";s:3:"161";s:10:"post_title";s:45:"Python字符串比较忽略大小写的方法";s:7:"matches";s:1:"2";s:9:"permalink";s:66:"http://azaleasays.com/2008/01/19/python-compare-string-ignorecase/";}i:6;a:4:{s:2:"ID";s:3:"160";s:10:"post_title";s:91:"Python:已知子字符串序列，返回子字符串在原字符串的所有位置(indices)";s:7:"matches";s:1:"2";s:9:"permalink";s:61:"http://azaleasays.com/2008/01/19/python-indices-of-substring/";}i:7;a:4:{s:2:"ID";s:3:"159";s:10:"post_title";s:49:"transcribe
    DNA sequence to RNA sequence in python";s:7:"matches";s:1:"2";s:9:"permalink";s:83:"http://azaleasays.com/2008/01/19/transcribe-dna-sequence-to-rna-sequence-in-python/";}i:8;a:4:{s:2:"ID";s:4:"1812";s:10:"post_title";s:35:"Maximum
    sum of consecutive integers";s:7:"matches";s:1:"1";s:9:"permalink";s:69:"http://azaleasays.com/2011/02/17/maximum-sum-of-consecutive-integers/";}i:9;a:4:{s:2:"ID";s:4:"1804";s:10:"post_title";s:32:"找钱问题--动态规划一例";s:7:"matches";s:1:"1";s:9:"permalink";s:91:"http://azaleasays.com/2011/02/16/coin-change-problem-an-application-of-dynamic-programming/";}}'
  _relation_threshold: '1'
  original_post_id: '1776'
  _wp_old_slug: '1776'
---
回文（<a href="http://en.wikipedia.org/wiki/Palindrome" target="_blank">Palindrome</a>），就是一个序列（如字符串）正着读反着读是一样的。生物信息学上最常见的就是转录因子在DNA上的结合位点通常都是回文结构。

个么如何判断一个字符串是回文结构呢？在<a href="http://www.youtube.com/watch?v=SXR9CDof7qw" target="_blank">MIT Introduction to CS and Programming Lec 4</a> (39:38) 里，介绍了递归的方法：
<pre>def isPalindrome(s):
    if len(s) &lt;= 1:
        return True
    else:
        return s[0] == s[-1] and isPalindrome(s[1:-1])</pre>
其实完全可以用循环实现，复杂度是一样的：
<pre>def isPalindrome1(s):
    for i in range(len(s))/2:
        if not s[i] == s[len(s)-i-1]:
            return False
    return True</pre>
不过其实我们都被忽悠啦，在Python里可以很容易的从回文的定义来判断，就是字符串的倒序和字符串本身是一样的话，就是回文。
<pre>def isPalindrome2(s):
    return s == s[::-1]
</pre>
以上的实现复杂度也是O(n)的，不过是python内部用C语言实现的，猜测会比前2个方法快。

总之这又是一个递归的失败的例子，<a href="http://en.wikipedia.org/wiki/Fibonacci_number" target="_blank">斐波那契数列</a>是另一个，递归的方法比循环的方法要慢很多。唯一我知道的递归是最适用的方法的就是<a href="http://en.wikipedia.org/wiki/Tower_of_Hanoi" target="_blank">汉诺塔</a>了。跑题了，不多说了。。
