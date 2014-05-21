---
layout: post
title: Qt debug 血泪教训
categories: 
tags:
- Qt
- debug
- 血泪教训

---

用 Qt 写的界面有2个 table view，其中一个我直接从同事写的 .ui 文件里复制粘贴了过来，第二个她没写，我于是自己拖了个 table view 过去。

在 .cpp 文件里，这两个 table view 的初始化加载数据什么的代码都一样，但是我复制粘贴的 table view，点标题栏会会出现一个箭头，表示 sort order，但是我自己创建的 table view，这个箭头死也不出现。

我昨天把 .cpp 文件里两个 table view 的代码对照着看了一个小时，也没看出来区别。今天忽然醒悟过来，Qt Designer 的 Design 页面，有个 pane 叫 Property Editor ...

# 不靠谱程序员
# Twitter 140字限制去死去死