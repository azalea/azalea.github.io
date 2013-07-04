---
layout: post
title: "Monty Hall Problem"
categories: 
tags:
  - fun
  - math
---

假设你参加一个娱乐节目，主持人给你看三扇关闭的门，其中一扇门后有汽车，另外两扇门后有山羊。你选择三扇门其中之一，门后的东东你可以抱回家。你选择了一扇门，比如说1号门，主持人此时打开另外一扇门，比如说3号门，门后是山羊，主持人问你，“你现在可以改选2号门，你要改变你的选择么？”

这就是著名的 Monty Hall Problem。最先由 Steve Selvin 在1975年提出，1990年由 Marilyn vos Savant 发表在 Parade magazine 的 “Ask Marilyn”专栏，引发了热烈的讨论。

正确的选择取决于主持人的策略。Marilyn 提出的是以下情况：主持人知道门后是什么，而且主持人的策略是必定打开一扇与游戏参与者所选的不同，且门后是山羊的门。这种情况下，Marilyn说，游戏参与者应该改变选择。在 Marilin 收到的数千封读者来信中，92%的普通民众不同意 Marilyn 的答案，而65%的来自大学的信件认为不应该改变选择。

那么到底谁是正确的呢？[Wikipedia](http://en.wikipedia.org/wiki/Monty_Hall_problem) 给出了各种解答，而[Morgan等人](http://www.its.caltech.edu/~ilian/ma2a/monty1.pdf)指出了其中大部分的错误之处。我只把正确答案抄在下面：

当游戏参与者选择第1扇门后，可能的结果和对应的概率是以下6个：

| **Outcomes** | AGG2 | AGG3 | GAG2 | GAG3 | GGA2 | GGA3 |
| --- | --- | --- | --- | --- | --- | --- |
| **Probability** | p<sub>12</sub> / 3 | p<sub>13</sub> / 3 | p<sub>22</sub> / 3 | p<sub>23</sub> / 3 | p<sub>32</sub> / 3 | p<sub>33</sub> / 3 |

其中，AGG2表示第1扇门后是汽车 (Auto)，第2扇门后是山羊 (Goat)，第3扇门后是山羊，且主持人打开的是第2扇门。

p<sub>ij</sub> 表示已知 i 门后是汽车且主持人打开 j 门的概率。因此 p<sub>i2</sub> + p<sub>i2</sub> = 1

以上概率都除以3的原因是汽车在任意门后的概率都是 1/3

因此，Pr(W<sub>s</sub> | D3) = Pr(GAG3) / Pr(AGG3, GAG3) = p<sub>23</sub> / (p<sub>13</sub> + p<sub>23</sub>)

p<sub>ij</sub>的具体数值取决于主持人的策略。Marilyn 提出的主持人策略是，打开的门与游戏参与者所选的不同，而且门后必定不是汽车。在这种情况下：

p<sub>12</sub> = p,  p<sub>13</sub> = q = 1 - p,  
p<sub>22</sub> = p<sub>33</sub> = 0,  p<sub>23</sub> = p<sub>32</sub> = 1

因此，Pr(W<sub>s</sub> | D3) = 1 / (1 + q) ≥ 1/2 

因此，答案是要改变选择，因为改变选择很有可能增加得到汽车的概率。

特殊地，当 p = q = 1/2，即主持人尽可能的随机打开2扇门后是山羊的门时，Pr(W<sub>s</sub> | D3) = 2/3 

有趣的是，主持人有一种策略可以使得 Pr(W<sub>s</sub> | D3) = 1/2，即游戏参与者改变选择与否都不能增加得到汽车的概率。这个策略是 q = 1，即主持人尽可能只打开第3扇门。

其实，这个问题很早就以别的面目出现过，它被成为“囚徒困境”或者“[The Serbelloni Problem](http://www.gnxp.com/MT2/archives/004048.html)”。有3个囚徒，马修，马克和卢克，其中2人要被处死，但是马修不知道到底是谁。因此他问狱卒说：“既然马克或卢克中的一个肯定会被处死，你告诉我他们两个中谁会被处死，其实并没有透露我是否会被处死的信息，是吧”。狱卒深以为然，诚实地说，马克会被处死。马修于是很高兴，因为他觉得在狱卒告诉他这个消息之前，他被处死的概率是2/3，而现在他和卢克2个人中有一个人不会被处死，因此他被处死的概率是1/2。问：马修高兴的理由是对的么？

答案可以在以下两本书中找到：

[Fifty Challenging Problems in Probability with Solutions](http://book.douban.com/subject/2193302/) page 28.

[Statistical Inference](http://book.douban.com/subject/1464795/) page 21.
