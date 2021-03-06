---
layout: post
title: 统计在手 发表不愁
tags:
- science
- 统计
- 论文
status: publish
type: post
published: true
meta:
  _edit_last: '1'
---
今天后知后觉地读到一年前在心理学界<a href="http://www.nytimes.com/2011/01/06/science/06esp.htm" target="_blank">掀起一片哗然</a>的文章：

<a href="http://psycnet.apa.org/journals/psp/100/3/407/" target="_blank">Bem, D. J. (2011). Feeling the future: Experimental evidence for anomalous retroactive influences on cognition and affect. <em>Journal of Personality and Social Psychology</em>, 100, 407-425.</a>

作者康奈尔大学心理学教授 <a href="http://www.psych.cornell.edu/people/Faculty/djb5.html" target="_blank">Bem</a> 在文中声称普通人有预知未来的能力。具体可参阅<a href="http://songshuhui.net/archives/52911" target="_blank">科学松鼠会当时的报道</a>。文章用9个实验证明，发生在未来的事情会对被试者之前的判断产生影响，且其中8个实验都具有统计显著性。

那么这样的统计显著性是怎么算出来的呢？

Wagenmakers等人 back to back 发表于同一期杂志的<a href="http://psycnet.apa.org/journals/psp/100/3/426/" target="_blank">评论文章</a>指出了上述文章的3大谬误：

<strong>1. 混淆了确认性研究和探索性研究</strong>

确认性研究就是，在进行实验之前已经有明确的假说。比如假说是，发生在未来的单词背诵练习会提高之前的自由回忆的准确率。然后收集实验数据，进行单次统计检验。

探索性研究就是，没有明确的假说，进行各种能想到的实验，从中找出有统计显著性的结果。这会导致多重比较 (<a href="http://en.wikipedia.org/wiki/Multiple_comparisons#Practical_examples" target="_blank">Multiple comparisons</a>) 的问题。比如检验一种新药是否对疾病症状有所改善，如果检验许多种症状，则很有可能其中某种症状表现出显著改善。借用维基百科 <a href="http://en.wikipedia.org/wiki/Multiple_comparisons#Practical_examples" target="_blank">Multiple comparisons</a> 文中的例子，如果扔一枚硬币10次其中9次以上都出现正面，那我们会怀疑这个硬币有偏倚，因为如果这个硬币没偏倚，10次出现9次以上正面的概率是 (10 + 1) × (1/2)<sup>10</sup>= 0.0107，确实不太可能。那么假设我们抛100枚不同的硬币，都没有偏倚，但是其中1个或以上硬币出现9次以上的概率是 1 - (1 − 0.0107)<sup>100</sup> ≈ 0.66，就是说，我们很有可能得出结论说其中某一枚硬币有偏倚，虽然指定的硬币A有偏倚的概率仍然是 0.0107。

Bem 的研究中，多次使用多重比较，但是没有对单次检验的显著性水平进行修正，因此高估了显著性。

Nov 11, 2012 Update: XKCD关于多重比较的犀利图一枚：


![](http://imgs.xkcd.com/comics/significant.png)
<strong>2. 条件概率倒置谬误</strong>（<a href="http://rationalwiki.org/wiki/Fallacy_of_the_transposed_conditional" target="_blank">Fallacy of the transposed conditional</a>）

统计检验得出的 p-value，并没有告诉我们我们想要的答案。我们想知道的是：“给定这些数据，H<sub>0 </sub>为真的概率 p(H<sub>0</sub>|D)。但实际上 p-value 表示的是，给定 H<sub>0 </sub>为真，出现这些数据的概率 p(D|H<sub>0</sub>)。正如 <a href="http://ist-socrates.berkeley.edu/~maccoun/PP279_Cohen1.pdf" target="_blank">Jacob Cohen 在1994年指出的</a>，这二者是不同的。

对 p-value的错误解读也许是这么来的：
<blockquote>如果 H<sub>0 </sub>正确，出现这些数据不太可能。

这些数据出现了。

所以， H<sub>0 </sub>不太可能是正确的。</blockquote>
乍一看来，上面的论述和逻辑学里面的<a href="http://zh.wikipedia.org/wiki/%E5%90%A6%E5%AE%9A%E5%BE%8C%E4%BB%B6" target="_blank">否定后件</a>（<a href="http://en.wikipedia.org/wiki/Modus_tollens" target="_blank">modus tollens</a>）差不多：
<blockquote>火星人不是五毛党。

这个人是五毛党。

所以，他不是火星人。</blockquote>
上述推论没任何问题。但是当第一句话换成概率而不是绝对确定时：
<blockquote>一个中国人不太可能是五毛党。（五毛党占人口比例应该不高，但愿小于5%）

这个人是五毛党。

所以，他不太可能是中国人。（什么？外国人那是5美分党好不好）</blockquote>
那些错误理解 p-value 的人，应该蹲在墙角<a href="http://mark.reid.name/iem/the-earth-is-round.html" target="_blank">哭去了</a>。

在 Bem 的文章里，他有意或无意滴错误解读了 p-value。文中，H<sub>0 </sub>是人不能预知未来，H<sub>1 </sub>是人可以预知未来。但由于H<sub>1 </sub>为真的先验概率无比的低，首先没有任何物理学和生物学的证据，其次如果H<sub>1 </sub>为真，人就可以靠预知未来在赌场发大财了（详见<a href="http://commonsenseatheism.com/wp-content/uploads/2010/11/Wagenmakers-Why-Psychologists-Must-Change-the-Way-They-Analyze-Their-Data.pdf" target="_blank">Wagenmakers等的估算</a>）。因此假定 p(H<sub>1</sub>) = 10<sup>-20</sup>。那么 p(H<sub>0</sub>) = 1 - 10<sup>-20</sup>。假设一个设计正确的实验得到的数据更可能在 H<sub>1 </sub>为真时出现，比如说是 H<sub>0 </sub>为真时的19倍。那么我们真正想知道的 p(H<sub>1</sub>|D) 可以如下计算


![](/images/2012/07/Screen-Shot-2012-07-05-at-1.58.41-AM.png)

虽然这个后验概率比先验概率 p(H<sub>1</sub>) = 10<sup>-20 </sup>高了不少，但仍然不足以证明人可以预知未来。

<strong>3. p-value 高估了证伪 H<sub>0 </sub>的证据</strong>

举个例子，比如说你中了彩票，别人说你作弊，因为中彩票是小概率事件。但是与中彩票相比，通过不法手段不正当关系提前得知中奖号码的概率更小（在大多数国家）。

因此，如果想用数据证伪 H<sub>0 </sub>，需要和 H<sub>1 </sub>相比较。虽然在 H<sub>0 </sub>为真时得到这些数据的概率很小，也许在 H<sub>1 </sub>为真时概率同样很小。

我们需要比较的是，

![](/images/2012/07/Screen-Shot-2012-07-05-at-2.29.47-AM.png)

用文字表述就是，

后验模型可能性 = 先验模型可能性 x 贝叶斯因子

(Posterior model odds = prior model odds x Bayes factor)

贝叶斯因子可以解释为数据带来的权重变化。

简单的说，如果 Bem 要证明预知未来的假说为真，贝叶斯因子需要在10<sup>-24 </sup>数量级，而他的实验中，基本都在1上下，最小不过0.17。因此完全不能证伪 H<sub>0 </sub>或证实 H<sub>1</sub>。

Nov 11, 2012 Update: XKCD的犀利图又一枚：


![](http://imgs.xkcd.com/comics/frequentists_vs_bayesians.png)

<strong>最后的话</strong>

其实我想说的是，如果想发文章，只要很好的发扬上述3个谬误就可以啦。事实上目前心理学、医学界一些文章都是这样做的，包括生物学文章里的统计部分（还好生物还有很多细胞果蝇线虫老鼠跑胶测序染色切片等等统计不可替代的部分）。

当然，如果明知故犯也不太好，但是如果真的做到设计实验统计都完美无缺，那基本是很难有显著性结果了。有个流行词叫 发表偏倚 (<a href="http://en.wikipedia.org/wiki/Publication_bias" target="_blank">Publication bias</a>)，就是说发表的结果大多是有统计显著性的，而其实也许每一个发表的显著性研究背后，都有99个被扔到废纸篓里的统计不显著研究（还记得多重比较么）。这就是为啥一些声称有效的疗法、声称显著的实验，却不能被重复的原因。

References

Bem, D. J. (2011). Feeling the future: Experimental evidence for anomalous retroactive influences on cognition and affect. <em>Journal of Personality and Social Psychology</em>, 100, 407-425.

Wagenmakers, E.-J., Wetzels, R., Borsboom, D., van der Maas, H. L. J. (2011). Why psychologists must change the way they analyze their data: The case of psi: Comment on Bem. <em>Journal of Personality and Social Psychology</em>, 100, 426-432.

Cohen, J. (1994). The earth is round (p &lt; .05). <em>American Psychologist</em>, 49, 997-1003.
