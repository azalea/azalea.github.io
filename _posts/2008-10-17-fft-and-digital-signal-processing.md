---
layout: post
title: 快速傅立叶变换(FFT)与数字信号处理
tags:
- algorithm
- math
- matlab
- programming
status: publish
type: post
published: true
meta:
  views: '1452'
  _searchme: '1'
---
<a href="http://en.wikipedia.org/wiki/Fast_Fourier_transform" target="_blank">快速傅立叶变换(FFT)</a>是<a href="http://en.wikipedia.org/wiki/Discrete_Fourier_transform" target="_blank">离散傅立叶变换(DFT)</a>的快速算法, 具体原理我也讲不清楚, 如果你从来没听过这2个词, 你就进错地方了...

FFT最经常的应用就是数字信号处理, 比如你有这样一堆信号:

Matlab代码是这样:
<div style="font-family:&quot;">t=linspace(0,2*pi,2^10); <span style="font-style:italic;color:#008800;">% discretizes [0, 2pi] into 256 nodes</span>
y=exp(-(cos(t).^2)).*(sin(2*t)+2*cos(4*t)+0.4*sin(t).*sin(50*t));</div>
画出来是酱紫:


![](https://dl.dropboxusercontent.com/u/308058/blogimages/2010/07/orisignal.png)
<a href="http://www.mathworks.com/access/helpdesk/help/techdoc/index.html?/access/helpdesk/help/techdoc/ref/fft.html" target="_blank">fft</a>和<a href="http://www.mathworks.com/access/helpdesk/help/techdoc/index.html?/access/helpdesk/help/techdoc/ref/ifft.html" target="_blank">ifft</a>了. fft就是快速傅立叶变换, 通过一系列信号值求出所有频率; 而ifft是逆向离散傅立叶变换, 即通过频率求信号值.
<div style="font-family:&quot;">t=linspace(0,2*pi,2^10); <span style="font-style:italic;color:#008800;">% discretizes [0, 2pi] into 1024 nodes</span>
y=exp(-(cos(t).^2)).*(sin(2*t)+2*cos(4*t)+0.4*sin(t).*sin(50*t));
z=fft(y,2^10);
y1=<span style="font-weight:bold;color:#000080;">if</span>ft([z(1:6) zeros(1,2^10-6*2) z(2^10-5:2^10)],2^10);
y1=real(y1);
plot(t,y)
hold on
plot(t,y1,<span style="color:#0000ff;">'r'</span>),title(<span style="color:#0000ff;">'Signal filtering with FFT: keeping 6 lowest frequencies'</span>),leg<span style="font-weight:bold;color:#000080;">end</span>(<span style="color:#0000ff;">'original signal'</span>,<span style="color:#0000ff;">'signal without high frequencies'</span>,<span style="color:#0000ff;">'Location'</span>,<span style="color:#0000ff;">'SouthOutside'</span>)
hold off</div>
要注意的是FFT得到的频率是对称的, 因此保留低频时两端的数据都要.

结果如图:


![](https://dl.dropboxusercontent.com/u/308058/blogimages/2010/07/filtered.png)
<div><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> t=linspace(0,2*pi,2^10);<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> y=exp(-t.^2/10).*(sin(2*t)+2*cos(4*t)+0.4*sin(t).*sin(10*t));<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> r=0.2; <span style="color:rgb(0,136,0);font-style:italic;">%20 percent of the original amount of storage</span><br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> a=floor(2^10*r);<br/><span class="lineno special"/> plot(t,y)<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> z=fft(y,2^10);<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> cutoff=sort(abs(z),<span style="color:rgb(0,0,255);">'descend'</span>);<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> <span style="color:rgb(0,0,128);font-weight:bold;">for</span> i=1:length(z)<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/>     <span style="color:rgb(0,0,128);font-weight:bold;">if</span> abs(z(i))&lt;cutoff(a)<br/><span class="lineno special"/>         z(i)=0;<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/>     <span style="color:rgb(0,0,128);font-weight:bold;">end</span><br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> <span style="color:rgb(0,0,128);font-weight:bold;">end</span>    <br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> y1=<span style="color:rgb(0,0,128);font-weight:bold;">if</span>ft(z,2^10);<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> y1=real(y1);<br/><span class="lineno special"/> plot(t,y)<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> hold on<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> plot(t,y1,<span style="color:rgb(0,0,255);">'r'</span>),title(<span style="color:rgb(0,0,255);">'Signal compression with FFT'</span>),leg<span style="color:rgb(0,0,128);font-weight:bold;">end</span>(<span style="color:rgb(0,0,255);">'original signal'</span>,<span style="color:rgb(0,0,255);">'compressed signal with 20% of original size'</span>)<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> hold off<br/><span style="color:rgb(0,136,0);font-style:italic;" class="lineno"/> saveas(1,<span style="color:rgb(0,0,255);">'prob8b.png'</span>);<br/></div>

结果:


![](http://azaleasays.files.wordpress.com/2008/10/compressed.png)
<a href="http://en.wikipedia.org/wiki/Lossy_compression" target="_blank">有损数据压缩</a>, 会损失一些数据, 但是人眼或人耳几乎是察觉不到的.

ps. 以上是我的期中作业, 具体对不对还要等老师公布答案才知道-.- 仅供参考..

Reference:

<a href="http://www.stata.com/support/faqs/mata/fourier.html" target="_blank">http://www.stata.com/support/faqs/mata/fourier.html</a>