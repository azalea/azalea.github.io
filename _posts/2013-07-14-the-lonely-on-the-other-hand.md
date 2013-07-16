---
layout: post
title: The lonely "On the other hand"
categories: 
tags:
  - 语言学
  
---
那天提笔想写 "On the other hand"，忽然想起以前被教育过，"On the other hand" 要和 "On (the) one hand" 配对使用（可惜我不记得罪魁祸首是谁了），但是总觉得有点不妥。于是内事不决问张昭，外事不决问周瑜，什么事都不决问 Google。

于是 Google 到了[这篇文章](http://languagelog.ldc.upenn.edu/nll/?p=4573)，文中分析了一个著名的语言学语料库 [WSJ Corpus](http://www.ldc.upenn.edu/Catalog/CatalogEntry.jsp?catalogId=LDC2000T43)，包含了华尔街日报 1987-1989 年间所有的文章，共约30万字。统计发现：

||次数统计|
| --- | --- |
| on (the) one hand 出现总次数 | 179 |
| on the other (hand) 出现总次数 | 1786 |
| 以上2个词组总是匹配出现的文章数 | 4 |
| 以上2个词组不匹配出现的文章数 | 1607 |

基本结论就是，on the other (hand) 可以单独出现，不需要先使用 "On (the) one hand"。

需要指出的是，以上分析是有 bug 的。首先，文章作者把 on the other 等同于 on the other hand，但是 on the other 很可能在其他情境出现，比如 "She went into a room with two chairs. One was occupied, so she sat on the other"。因此很可能高估了 on the other hand 单独出现的比例。其次，这个语料库仅仅是一本杂志3年间的文章总和，不能代表广大讲英语的人民群众，也不能反映历史趋势。

于是我们要祭出神器，[Google Ngram Viewer](http://books.google.com/ngrams)。这个神器统计了各个语言书籍里词组的出现频率。搜索 `on one hand,on the one hand,on the other hand`，我们就得到了下图（[原图](http://books.google.com/ngrams/graph?content=on+one+hand%2C+on+the+one+hand%2C+on+the+other+hand&year_start=1800&year_end=2000&corpus=15&smoothing=0&share=)):

![ngram](https://dl.dropboxusercontent.com/u/308058/blogimages/2013/07/ngram_on_the_other_hand.png)

我们可以得到以下结论：

1. on one hand 和 on the one hand 加起来，大概有 on the other hand 的一半。这个比例远没有[这篇文章](http://languagelog.ldc.upenn.edu/nll/?p=4573)中计算的那么悬殊。不过这仍然说明大多数 on the other hand 并不与 on (the) one hand 配对出现。
2. on the one hand 远比 on one hand 出现频率高。这个我还是第一次知道。

我们不能得到的结论是：
on (the) one hand 是不是可以单独使用。要解答这个问题，需要在 on (the) one hand 出现后的几句话内，寻找 on the other hand。这就不是简单的频率统计能告诉我们的了。
