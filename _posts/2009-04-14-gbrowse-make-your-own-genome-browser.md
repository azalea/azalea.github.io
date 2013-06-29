---
layout: post
title: 用GBrowse定制你自己的基因组浏览器
tags:
- bioinformatics
- genome
- software
- study
status: publish
type: post
published: true
meta:
  _searchme: '1'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
  views: '1226'
---
接触过基因组学的同学想必都知道<a href="http://genome.ucsc.edu/cgi-bin/hgGateway" target="_blank">UCSC Genome Browser</a>，在那里可以像看书一样浏览数十种物种的基因组，包括编码序列，调控序列，ChIP-chip数据，芯片数据，EST序列，保守序列等等; 可以指定要看的位置，比如<a href="http://genome.ucsc.edu/cgi-bin/hgTracks?hgsid=130086399&amp;clade=mammal&amp;org=Human&amp;db=hg18&amp;position=chrX%3A151%2C073%2C054-151%2C383%2C976&amp;pix=800&amp;Submit=submit" target="_blank">Human chrX:151,073,054-151,383,976</a>，随意放大缩小，展开或收起数据。

但是如果你想要浏览的物种不在<a href="http://genome.ucsc.edu/cgi-bin/hgGateway" target="_blank">UCSC Genome Browser</a>，你应该试试<strong><a href="http://gmod.org/wiki/Gbrowse" target="_blank">GBrowse</a></strong>！GBrowse是个开源的基因组浏览器框架，你只需要导入特定格式的数据，就可以在GBrowse的图形界面里浏览你的基因组了。GBrowse的界面到底什么样子？可以看看<a href="http://flybase.org/cgi-bin/gbrowse/dmel/" target="_blank">FlyBase</a>或<a href="http://www.wormbase.org/db/seq/gbrowse/c_elegans/" target="_blank">WormBase</a>.

下面就简单介绍一下GBrowse的安装、设置和使用。

<a href="http://azaleasays.com/2009/04/14/gbrowse-make-your-own-genome-browser/#install" target="_self">安装</a>

<a href="http://azaleasays.com/2009/04/14/gbrowse-make-your-own-genome-browser/#installerror" target="_self">安装错误解决方法</a>

<a href="http://azaleasays.com/2009/04/14/gbrowse-make-your-own-genome-browser/#setting">设置</a>

<a href="http://azaleasays.com/2009/04/14/gbrowse-make-your-own-genome-browser/#settingerror">设置错误解决方法</a>

<a href="http://azaleasays.com/2009/04/14/gbrowse-make-your-own-genome-browser/#use">使用</a>

<!--more-->
<div id="install"><strong>安装</strong></div>
这里只介绍Ubuntu/Debian下的安装方法，其他系统请参考<a href="http://gmod.org/wiki/GBrowse#Installation" target="_blank">GBrowse的wiki页面</a>。

首先，按照<a href="http://gmod.org/wiki/GBrowse_Ubuntu_HOWTO" target="_blank">GBrowse的Ubuntu安装指南</a>，安装Apache, libgd, MySQL和其他一些包，然后下载网络安装脚本 <a class="external text" title="http://gmod.cvs.sourceforge.net/*checkout*/gmod/Generic-Genome-Browser/bin/gbrowse_netinstall.pl" rel="nofollow" href="http://gmod.cvs.sourceforge.net/*checkout*/gmod/Generic-Genome-Browser/bin/gbrowse_netinstall.pl">Generic-Genome-Browser/bin/gbrowse_netinstall.pl</a>，运行:

<span style="color:#3366ff;">sudo perl gbrowse_netinstall.pl</span>

<span style="color:#3366ff;"><span style="color:#000000;">等待...如果没有错误，那么恭喜你，去买彩票吧。买之前可以在</span></span><a class="external free" title="http://localhost/gbrowse" rel="nofollow" href="http://localhost/gbrowse">http://localhost/gbrowse</a><span style="color:#3366ff;"><span style="color:#000000;">欣赏一下安装成果。</span></span>
<div id="installerror"><strong>安装错误解决方法</strong></div>
<span style="color:#3366ff;"><span style="color:#000000;">安装不出错是不正常的，不信去搜索一下<a href="http://www.google.com/search?q=Gbrowse+installation+error" target="_blank">GBrowse Intallation Error</a>.
</span></span>

<span style="color:#3366ff;"><span style="color:#000000;">错误：</span></span>Bio::Graphics版本过低

解决：不要使用网络安装脚本，手动安装

步骤：用CPAN安装Bio::Perl and Bio::Graphics
<span style="color:#3366ff;">sudo perl -MCPAN -e 'install GD::SVG'</span>
<span style="color:#3366ff;">sudo perl -MCPAN -e 'install Bio::Perl' </span> (if not working,  <span style="color:#3366ff;">sudo apt-get install bioperl</span>)
<span style="color:#3366ff;">sudo perl -MCPAN -e 'install Bio::Graphics'</span>

<span style="color:#3366ff;"><span style="color:#000000;">如仍有错误，请参考</span></span><a href="http://gmod.org/wiki/GBrowse_2.0_Prerequisites">http://gmod.org/wiki/GBrowse_2.0_Prerequisites</a>，把所有需要的包都安装一遍。然后重复上面CPAN的安装命令。

如仍有错误，请自行Google...

如果一切顺利，则下载 <a href="http://downloads.sourceforge.net/gmod/Generic-Genome-Browser-1.69.tar.gz?use_mirror=voxel">http://downloads.sourceforge.net/gmod/Generic-Genome-Browser-1.69.tar.gz?use_mirror=voxel</a>

进入解压后的文件夹：

perl Makefile.PL
make
sudo make install

于是GBrowse就安装好了。<span style="color:#3366ff;"><span style="color:#000000;">请去</span></span><a class="external free" title="http://localhost/gbrowse" rel="nofollow" href="http://localhost/gbrowse">http://localhost/gbrowse</a><span style="color:#3366ff;"><span style="color:#000000;">欣赏一下安装成果。</span></span>
<div id="setting"><strong>设置</strong></div>
<span style="color:#3366ff;"><span style="color:#000000;">安装成功后，可以看到GBrowse教程：</span></span><a href="http://localhost/gbrowse/tutorial/tutorial.html">http://localhost/gbrowse/tutorial/tutorial.html</a>
如果你没安装好，网上有完全一样的教程： <a href="http://mckay.cshl.edu/gbrowse/tutorial/tutorial.html">http://mckay.cshl.edu/gbrowse/tutorial/tutorial.html</a>

请仔细按照<a href="http://localhost/gbrowse/tutorial/tutorial.html#basics">1. The Basics</a>的步骤进行设置。

如果一切顺利，你会看到这个页面：<a href="http://localhost/cgi-bin/gbrowse/volvox">http://localhost/cgi-bin/gbrowse/volvox</a>

请自行参考教程下面的部分，have fun!
<div id="settingerror"><strong>设置错误解决方法</strong></div>
错误：按<a href="http://localhost/gbrowse/tutorial/tutorial.html#basics">1. The Basics</a>设置后，这个页面：<a href="http://localhost/cgi-bin/gbrowse/volvox">http://localhost/cgi-bin/gbrowse/volvox</a>是空白或者返回Internal Server Error

解决：教程里有讲到，首先检查以下问题是否存在：

1. 检查文件volvox.conf是否正确

2. 检查文件volvox1.gff3是否存在于database目录

3. 如果是Windows系统，检查上面2个文件的扩展名，确定扩展名是conf或gff3而不是txt

4. 检查Apache server的<strong><span style="color:#000000;">error_log</span></strong>文件。

Linux下通常在 /usr/local/apache/logs, /var/log/apache2, /var/log/www, 或 /var/log/httpd

Windows下通常在C:Program FilesApache GroupApache2logs,

错误信息通常是找不到某某文件

错误：找不到Text/ShellWords.pm

解决：<a href="http://dl.getdropbox.com/u/308058/blog/Shellwords.pm" target="_blank">下载ShellWords.pm</a>，然后在Perl库文件的目录下 （我的是 /usr/local/share/perl/5.8.8），创建目录 Text，然后复制ShellWords.pm到此目录。
<div id="use"><strong>使用</strong></div>
按照教程来玩，应该不会有啥问题。Enjoy!
