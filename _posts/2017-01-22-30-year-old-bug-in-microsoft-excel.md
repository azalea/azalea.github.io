---
layout: post
title: Microsoft Excel 的陈年旧 bug
categories: 
tags:
  - 程序员
  - 业界八卦
---

Microsoft Excel 里的 bug：输入2/26/1900，然后右键-格式-日期，选择显示星期几，Excel 显示1900年2月26日是星期日。如图一：

![图一](/images/2017/01/feb_1900_excel.png)

而图二是1900年2月的正确日历（鸣谢苹果日历），2月26日是星期一：

![图二](/images/2017/01/feb_1900.png)

不信苹果的话，也可以翻翻家里的万年历 ;)

Excel 不仅把1900年2月26日是星期几搞错了，而且搞错了27日，28日，更神奇的是，Excel 认为，1900年，有2月29日！见图一。这个bug，自Excel 1985年问世以来，已经存在了31年之久。可以在 Excel Windows 版的各个版本上测试（苹果版没有这个bug）。

这个 bug 的原因是，Excel 认为1900年是闰年，于是1900年2月29日要占用一天的有效日期，因此，那天之前的日期是星期几的结果都错了一天。

小学生都知道1900年不是闰年（你说你不知道？回炉重读去），为何 Excel 不知道呢？

Excel 的[官方文档](https://support.microsoft.com/en-us/help/214326/excel-incorrectly-assumes-that-the-year-1900-is-a-leap-year)里，是这样声泪俱下地解释的：

> 在 Excel 诞生之前，电子表格软件的天下是属于 Lotus 1-2-3 的。而 Lotus 1-2-3 就假设1900年是闰年，这样计算和处理闰年方便快捷。Excel 为了和市场领导者 Lotus 1-2-3 兼容，使用了同样的日期数据格式，并且兼容了这个bug，这样用户就可以无缝地在 Excel 上读写 Lotus 1-2-3 文件。几年后，Excel打败了 Lotus 1-2-3，但是 Excel 也要兼容自己老版本的文件，一旦修复了这个bug，则：
>
> 1. 所有 Excel 文件里的日期，都会差一天。修正这些数据要花费人力物力。
>
> 2. 使用日期相关函数的公式，可能会得出错误结果。
>
> 3. 会导致兼容 Excel 日期的其他软件不再兼容。
>
> 所以，我们决定让这个 bug 长命百岁。

为啥苹果系统没有这个 bug？因为 Excel 苹果版默认使用1904日期系统，这个系统直接跳过了1900年。详见：[XL: The 1900 Date System vs. the 1904 Date System](https://support.microsoft.com/en-us/help/180162/xl-the-1900-date-system-vs.-the-1904-date-system)。

后记：

之所以写这篇文章，是有感于修复 bug 并不像表面看起来那么简单。因此，在下次控诉凉企的渣渣程序员，为什么 bug 一年多了还不修复，请想一想微软。






