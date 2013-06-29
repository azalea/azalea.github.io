---
layout: post
title: matplotlib绘图实例1：scatter plot
tags:
- matplotlib
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '553'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
---
<a href="http://dl.dropbox.com/u/308058/blog/2010/precision.p" target="_blank"><img class="aligncenter size-medium wp-image-1376" title="expression_precision_scatterplot" src="http://azaleasays.com/wp-content/uploads/2010/07/expression_precision_scatterplot.png?w=500" alt="" width="500" height="285" /></a>

<a href="http://dl.dropbox.com/u/308058/blog/2010/precision.p" target="_blank">数据文件</a>

<pre><span style="color:#000000;">from</span> <span style="color:#000000;">matplotlib</span> <span style="color:#000080;font-weight:bold;">import</span> <span style="color:#000000;">rc</span>
<div class="source" style="font-family:&amp;color:#000000;"><span style="color:#008800;font-style:italic;"># Change the default font</span>
<span style="color:#000000;">font</span> <span style="color:#000000;">=</span> <span style="color:#000000;">{</span><span style="color:#0000ff;">'family'</span> <span style="color:#000000;">:</span> <span style="color:#0000ff;">'sans-serif'</span><span style="color:#000000;">,</span>
<span style="color:#0000ff;">'sans-serif'</span> <span style="color:#000000;">:</span> <span style="color:#0000ff;">'Arial'</span><span style="color:#000000;">,</span>
<span style="color:#0000ff;">'size'</span> <span style="color:#000000;">:</span> <span style="color:#0000ff;">'14.0'</span><span style="color:#000000;">}</span>
<span style="color:#000000;">rc</span>(<span style="color:#0000ff;">'font'</span><span style="color:#000000;">,</span> <span style="color:#000000;">**</span><span style="color:#000000;">font</span>)

<span style="color:#000000;">import</span> <span style="color:#000000;">numpy</span> <span style="color:#000080;font-weight:bold;">as</span> np
<span style="color:#000000;">import</span> <span style="color:#000000;">matplotlib.pyplot</span> <span style="color:#000080;font-weight:bold;">as</span> <span style="color:#000000;">plt</span>
<span style="color:#000000;">import</span> <span style="color:#000000;">pickle</span>

<span style="color:#000080;font-weight:bold;">def</span> <span style="color:#000000;">set_properties</span>(<span style="color:#000000;">ax</span><span style="color:#000000;">):</span>
<span style="color:#000000;">    ax</span><span style="color:#000000;">.</span><span style="color:#000000;">plot</span>((<span style="color:#000000;">-</span><span style="color:#0000ff;">0.05</span><span style="color:#000000;">,</span><span style="color:#0000ff;">1.05</span><span style="color:#000000;">),(</span><span style="color:#0000ff;">0.25</span><span style="color:#000000;">,</span><span style="color:#0000ff;">0.25</span><span style="color:#000000;">),</span><span style="color:#0000ff;">'g'</span>)
<span style="color:#000000;">    ax</span><span style="color:#000000;">.</span><span style="color:#000000;">plot</span>((<span style="color:#0000ff;">0.25</span><span style="color:#000000;">,</span><span style="color:#0000ff;">0.25</span><span style="color:#000000;">),(</span><span style="color:#000000;">-</span><span style="color:#0000ff;">0.05</span><span style="color:#000000;">,</span><span style="color:#0000ff;">1.05</span><span style="color:#000000;">),</span><span style="color:#0000ff;">'g'</span>)
    <span style="color:#000000;">ax</span><span style="color:#000000;">.</span><span style="color:#000000;">set_xlabel</span>(<span style="color:#0000ff;">'A. thaliana precision'</span>)
<span style="color:#000000;">    ax</span><span style="color:#000000;">.</span><span style="color:#000000;">set_ylabel</span>(<span style="color:#0000ff;">'A. lyrata precision'</span>)
<span style="color:#000000;">    ax</span><span style="color:#000000;">.</span><span style="color:#000000;">set_xlim</span>((<span style="color:#000000;">-</span><span style="color:#0000ff;">0.05</span><span style="color:#000000;">,</span><span style="color:#0000ff;">1.05</span>))
<span style="color:#000000;">    ax</span><span style="color:#000000;">.</span><span style="color:#000000;">set_xticks</span>(np<span style="color:#000000;">.</span><span style="color:#000000;">arange</span>(<span style="color:#0000ff;">0</span><span style="color:#000000;">,</span><span style="color:#0000ff;">1.05</span><span style="color:#000000;">,</span><span style="color:#0000ff;">0.2</span>))
<span style="color:#000000;">    ax</span><span style="color:#000000;">.</span><span style="color:#000000;">set_ylim</span>((<span style="color:#000000;">-</span><span style="color:#0000ff;">0.05</span><span style="color:#000000;">,</span><span style="color:#0000ff;">1.05</span>))
<span style="color:#000000;">    ax</span><span style="color:#000000;">.</span><span style="color:#000000;">set_yticks</span>(np<span style="color:#000000;">.</span><span style="color:#000000;">arange</span>(<span style="color:#0000ff;">0</span><span style="color:#000000;">,</span><span style="color:#0000ff;">1.05</span><span style="color:#000000;">,</span><span style="color:#0000ff;">0.2</span>))
<span style="color:#000000;">    ax</span><span style="color:#000000;">.</span><span style="color:#000000;">set_aspect</span>(<span style="color:#0000ff;">1.</span><span style="color:#000000;">/</span><span style="color:#000000;">ax</span><span style="color:#000000;">.</span><span style="color:#000000;">get_data_ratio</span>()) <span style="color:#008800;font-style:italic;">#make the figure in square shape</span>

<span style="color:#008800;font-style:italic;">#Read data from file</span>
<span style="color:#000000;">athMC</span><span style="color:#000000;">,</span><span style="color:#000000;">alyMC</span><span style="color:#000000;">,</span><span style="color:#000000;">athLC</span><span style="color:#000000;">,</span><span style="color:#000000;">alyLC</span> <span style="color:#000000;">=</span> <span style="color:#000000;">pickle</span><span style="color:#000000;">.</span><span style="color:#000000;">load</span>(<span style="color:#000000;">open</span>(<span style="color:#0000ff;">'precision.p'</span>))

<span style="color:#000000;">fig</span> <span style="color:#000000;">=</span> <span style="color:#000000;">plt</span><span style="color:#000000;">.</span><span style="color:#000000;">figure</span>(<span style="color:#000000;">figsize</span><span style="color:#000000;">=</span>(<span style="color:#0000ff;">7</span><span style="color:#000000;">,</span> <span style="color:#0000ff;">4</span>))

<span style="color:#000000;">ax1</span> <span style="color:#000000;">=</span> <span style="color:#000000;">fig</span><span style="color:#000000;">.</span><span style="color:#000000;">add_axes</span><span style="color:#000000;">([</span><span style="color:#0000ff;">0.1</span><span style="color:#000000;">,</span> <span style="color:#0000ff;">0.05</span><span style="color:#000000;">,</span> <span style="color:#0000ff;">0.30</span><span style="color:#000000;">,</span> <span style="color:#0000ff;">1</span><span style="color:#000000;">])</span>
<span style="color:#000000;">ax1</span><span style="color:#000000;">.</span><span style="color:#000000;">plot</span>(<span style="color:#000000;">athMC</span><span style="color:#000000;">,</span><span style="color:#000000;">alyMC</span><span style="color:#000000;">,</span><span style="color:#0000ff;">'bo'</span>)
<span style="color:#000000;">set_properties</span>(<span style="color:#000000;">ax1</span>)
<span style="color:#000000;">plt</span><span style="color:#000000;">.</span><span style="color:#000000;">suptitle</span>(<span style="color:#0000ff;">r'More conserved (MC)'</span><span style="color:#000000;">,</span><span style="color:#000000;">x</span><span style="color:#000000;">=</span><span style="color:#0000ff;">0.18</span><span style="color:#000000;">,</span><span style="color:#000000;">y</span><span style="color:#000000;">=</span><span style="color:#0000ff;">0.9</span><span style="color:#000000;">,</span><span style="color:#000000;">color</span><span style="color:#000000;">=</span><span style="color:#0000ff;">'k'</span><span style="color:#000000;">,</span><span style="color:#000000;">fontsize</span><span style="color:#000000;">=</span><span style="color:#0000ff;">16</span>)

<span style="color:#000000;">ax2</span> <span style="color:#000000;">=</span> <span style="color:#000000;">fig</span><span style="color:#000000;">.</span><span style="color:#000000;">add_axes</span><span style="color:#000000;">([</span><span style="color:#0000ff;">0.5</span><span style="color:#000000;">,</span> <span style="color:#0000ff;">0.05</span><span style="color:#000000;">,</span> <span style="color:#0000ff;">0.30</span><span style="color:#000000;">,</span> <span style="color:#0000ff;">1</span><span style="color:#000000;">])</span>
<span style="color:#000000;">ax2</span><span style="color:#000000;">.</span><span style="color:#000000;">plot</span>(<span style="color:#000000;">athLC</span><span style="color:#000000;">,</span><span style="color:#000000;">alyLC</span><span style="color:#000000;">,</span><span style="color:#0000ff;">'ro'</span>)
<span style="color:#000000;">set_properties</span>(<span style="color:#000000;">ax2</span>)
<span style="color:#000000;">plt</span><span style="color:#000000;">.</span><span style="color:#000000;">suptitle</span>(<span style="color:#0000ff;">r'Less conserved (LC)'</span><span style="color:#000000;">,</span><span style="color:#000000;">x</span><span style="color:#000000;">=</span><span style="color:#0000ff;">0.58</span><span style="color:#000000;">,</span><span style="color:#000000;">y</span><span style="color:#000000;">=</span><span style="color:#0000ff;">0.9</span><span style="color:#000000;">,</span><span style="color:#000000;">color</span><span style="color:#000000;">=</span><span style="color:#0000ff;">'k'</span><span style="color:#000000;">,</span><span style="color:#000000;">fontsize</span><span style="color:#000000;">=</span><span style="color:#0000ff;">16</span>)

<span style="color:#000000;">plt</span><span style="color:#000000;">.</span><span style="color:#000000;">show</span>()
<span style="color:#008800;font-style:italic;">#plt.savefig('expression_precision_scatterplot.png')</span>
<span style="color:#008800;font-style:italic;">#plt.savefig('expression_precision_scatterplot.ps')</span></div>

</pre>
