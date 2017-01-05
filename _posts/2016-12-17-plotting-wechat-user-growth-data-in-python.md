---
layout: post
title: 用Python画微信用户增长图
categories: 
tags:
  - python
  - matplotlib
---

读到[《腾讯传》](https://book.douban.com/subject/26929955/)讲微信爆发式增长一段，于是根据书中数据和其他资料，画了个图：

![](/images/2016/12/wechat_user_growth.png)

基本结论就是2011年下半年是拐点，之后微信用户人数开始快速增长。

90%的时间都在整理数据。。。还要各种不一致，心好累。基本上用户人数是向下取整，比如说四百多万人，就用4000000。日期是向后取整，比如说11月用户人数达到多少，没有具体日期的话，就用11月最后一天。所以整体应该略低估。第一个数据点选在2010年11月20日，微信立项的日期，用户人数其实应该是0啦，写1是方便取对数，当然1也可以理解成张小龙。

以下代码：

    import matplotlib.pyplot as plt
    import pandas as pd

    data = [('2010-11-20', 1),
            ('2011-01-21', 10000),
            ('2011-07-01', 4000000),
            ('2011-08-31', 15000000),
            ('2011-11-30', 45000000),
            ('2011-12-31', 50000000),
            ('2012-03-31', 100000000),
            ('2012-09-17', 200000000),
            ('2013-01-15', 300000000),
            ('2013-07-24', 400000000)]

    dates, user_counts = zip(*data)
    dates = pd.to_datetime(dates, format='%Y-%m-%d')

    fig, ax = plt.subplots(figsize=(8, 5))
    ax.plot(dates, user_counts, 'ko')
    fig.autofmt_xdate()
    ax.spines['right'].set_visible(False)
    ax.spines['top'].set_visible(False)
    ax.yaxis.set_ticks_position('left')
    ax.xaxis.set_ticks_position('bottom')
    deltadays = pd.to_timedelta(30, unit='D')
    ax.set_xlim(dates[0] - deltadays, dates[-1] + deltadays)
    ax.set_xticks(dates)
    adjustment = 1e7
    ax.set_ylim(user_counts[0] - adjustment, user_counts[-1] + adjustment)
    ax.set_ylabel('Number of WeChat Users')
    # plt.show()
    plt.savefig('wechat_users.png')

数据来源：

[吴晓波《腾讯传：中国互联网公司进化论》](https://book.douban.com/subject/26929955/)

[知乎：截至目前（2011年11月中），微信的用户数是多少？](https://www.zhihu.com/question/19931494)

[新浪网：微信进行时：厚积薄发的力量](http://tech.sina.com.cn/i/2012-01-13/11256636131.shtml)

[熊江《小QQ大帝国：马化腾传奇》](https://books.google.com/books?id=_QXlBwAAQBAJ&pg=PT77&lpg=PT77&dq=%E5%BE%AE%E4%BF%A1+%E7%AA%81%E7%A0%B44%E4%BA%BF&source=bl&ots=DZS9vBe7cZ&sig=6H2aYPxUoBc7Hf4RaOKLPVM3obM&hl=en&sa=X&ved=0ahUKEwiKuZu8tvrQAhUlBMAKHRpWB2QQ6AEISTAJ#v=onepage&q=%E5%BE%AE%E4%BF%A1%20%E7%AA%81%E7%A0%B44%E4%BA%BF&f=false)
