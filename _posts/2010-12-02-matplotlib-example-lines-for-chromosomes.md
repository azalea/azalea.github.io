---
layout: post
title: matplotlib绘图实例3：染色体直线示意图
tags:
- genome
- matplotlib
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  aktt_notify_twitter: 'no'
  _edit_last: '1'
  _efficient_related_posts: a:10:{i:0;a:4:{s:2:"ID";s:4:"1371";s:10:"post_title";s:36:"matplotlib绘图实例2：color
    mesh";s:7:"matches";s:1:"2";s:9:"permalink";s:63:"http://azaleasays.com/2010/04/29/matplotlib-example-color-mesh/";}i:1;a:4:{s:2:"ID";s:4:"1374";s:10:"post_title";s:38:"matplotlib绘图实例1：scatter
    plot";s:7:"matches";s:1:"2";s:9:"permalink";s:65:"http://azaleasays.com/2010/04/28/matplotlib-example-scatter-plot/";}i:2;a:4:{s:2:"ID";s:4:"1355";s:10:"post_title";s:22:"matplotlib新手教程";s:7:"matches";s:1:"2";s:9:"permalink";s:59:"http://azaleasays.com/2010/04/27/matplotlib-beginner-guide/";}i:3;a:4:{s:2:"ID";s:3:"367";s:10:"post_title";s:12:"爱的方程";s:7:"matches";s:1:"2";s:9:"permalink";s:48:"http://azaleasays.com/2008/06/18/fomula-of-love/";}i:4;a:4:{s:2:"ID";s:3:"237";s:10:"post_title";s:42:"Python
    Matplotlib logarithmic scatter plot";s:7:"matches";s:1:"2";s:9:"permalink";s:76:"http://azaleasays.com/2008/03/04/python-matplotlib-logarithmic-scatter-plot/";}i:5;a:4:{s:2:"ID";s:2:"83";s:10:"post_title";s:33:"今天写了第一个python程序";s:7:"matches";s:1:"2";s:9:"permalink";s:54:"http://azaleasays.com/2007/09/13/first-python-program/";}i:6;a:4:{s:2:"ID";s:4:"1812";s:10:"post_title";s:35:"Maximum
    sum of consecutive integers";s:7:"matches";s:1:"1";s:9:"permalink";s:69:"http://azaleasays.com/2011/02/17/maximum-sum-of-consecutive-integers/";}i:7;a:4:{s:2:"ID";s:4:"1804";s:10:"post_title";s:32:"找钱问题--动态规划一例";s:7:"matches";s:1:"1";s:9:"permalink";s:91:"http://azaleasays.com/2011/02/16/coin-change-problem-an-application-of-dynamic-programming/";}i:8;a:4:{s:2:"ID";s:4:"1792";s:10:"post_title";s:30:"Cannot
    find python intepreter ";s:7:"matches";s:1:"1";s:9:"permalink";s:63:"http://azaleasays.com/2011/01/15/cannot-find-python-intepreter/";}i:9;a:4:{s:2:"ID";s:4:"1776";s:10:"post_title";s:42:"python判断字符串是否是回文结构";s:7:"matches";s:1:"1";s:9:"permalink";s:61:"http://azaleasays.com/2010/12/11/python-string-is-palindrome/";}}
  _relation_threshold: '1'
  original_post_id: '1762'
  _wp_old_slug: '1762'
---
<a href="http://azaleasays.com/wp-content/uploads/2010/12/positions.png"><img class="size-full wp-image-1764 alignnone" title="positions" src="http://azaleasays.com/wp-content/uploads/2010/12/positions.png" alt="" width="600" height="400" /></a>

这个是自己<a href="http://matplotlib.sourceforge.net/examples/api/artist_demo.html" target="_blank">现学现卖</a>，画来玩玩的，用来做slides里的示意图。感觉如果扩展一下加入zoom-in，zoom-out和slider的话，可以做成基因组浏览器（Genome Browser，比如<a href="http://www.broadinstitute.org/igv/" target="_blank">IGV</a>）。

这个画的是2个<em>MIRNA165</em>基因（橙色箭头）和7个<em>MIRNA166</em>基因（红色箭头，有2个位置很近看起来重合）在<em>Arabidopsis thaliana</em>（我们最爱滴模式植物）5条染色体上的位置。

箭头方向表明基因转录方向，右方向表明基因在正链，左方向表示基因在负链。箭头起点是<em>MIRNA</em>基因位置，箭头长度没意义（这里用的固定长度，因为<em>MIRNA</em>太短了，在整条染色体上，按正常比例看，就是一个点）。

染色体长度数据可以从<a href="http://arabidopsis.org/" target="_blank">TAIR</a>获得，<em>MIRNA</em>位置是用的pre-miRNA估计的，有误差，数据来自<a href="http://www.mirbase.org/" target="_blank">miRBase</a>。

<pre>import numpy as np
import matplotlib.pyplot as plt
import matplotlib.lines as mlines
import matplotlib.patches as mpatches

# data start here
# length of the chromosomes
chromosome_length = {1: 30427671,
        2: 19698289,
        3: 23459830,
        4: 18585056,
        5: 26975502}

longest_chromosome = float(max(chromosome_length.values()))

# positions of the data points
# key=chromosome, value=tuple of the start position and the strand
positions165 = {1:((79037,'-'),),
                4:((370012,'-'),)}

positions166 = {2: ((19176108,'+'),),
                3: ((22922206,'+'),),
                5: ((2838635,'+'),(2840622,'+'),(16775662,'-'),
                    (17516301,'+'),(25504798,'+'))}

# data end here

fig = plt.figure(figsize=(6,4))
ax = plt.axes([0,0,1,1])

# create 1 x N (number of chromosomes) grid to plot the chromosomes
N = len(chromosome_length)
pos = np.mgrid[0:1:1, 0:1:1.0/N].reshape(2, -1)

# leave some blank space at the border
xshift = 0.03
yshift = 0.1

# add one line for each chromosome
for k, v in chromosome_length.items():
    # calculate line length proportional to the chromosome length
    x,y = np.array([[xshift,xshift+ 
        (1-2*xshift)*v/longest_chromosome], [yshift,yshift]])
    line = mlines.Line2D(x+pos[0,N-k], y+pos[1,N-k], 
        lw=5,alpha=0.2,color='k')
    plt.text(xshift+pos[0,N-k], yshift+pos[1,N-k]-0.05, 
        'chromosome %d'%k, ha='left', size=14)
    ax.add_line(line)

# add one short colored arrow for each data point
colors = ('orange','red')
all_positions = (positions165,positions166)
for positions,color in zip(all_positions,colors):
    for k, v in positions.items():
        for start,strand in v:
            x,y = xshift+(1-2*xshift)*start/longest_chromosome, 
                yshift
            # xoffset is the direction and length of the arrow
            if strand == '+':
                xoffset = 0.02
            else:
                xoffset = -0.02
            arrow = mpatches.Arrow(x+pos[0,N-k], y+pos[1,N-k], 
                xoffset, 0, width=0.1,color=color)
            ax.add_patch(arrow)

ax.set_xticks([])
ax.set_yticks([])

plt.show()
#plt.savefig('positions.png')</pre>
