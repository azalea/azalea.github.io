---
layout: post
title: python读取文件末尾的一行或多行 转载
tags:
- programming
- python
- zz
- 文件
status: publish
type: post
published: true
meta:
  views: '4499'
---
<pre>from: <a href="http://www.zeuux.org/pipermail/zeuux-python/2005-December/020677.html" target="_blank">http://www.zeuux.org/pipermail/zeuux-python/2005-December/020677.html</a>
<div><span style="font-style:italic;color:#008800;">#tail.py</span>
<span style="font-style:italic;color:#008800;">#Usage: python tail.py FILENAME LINES</span>
<span style="font-style:italic;color:#008800;">#similar to linux command: tail -n LINES FILENAME</span>
 <span style="color:#000080;font-weight:bold;">def</span> last_lines(filename, lines = <span style="color:#0000ff;">1</span>):
     <span style="color:#008800;font-style:italic;">#print the last several line(s) of a text file</span>
     <span style="color:#0000ff;">"""</span>
 <span style="color:#0000ff;">    Argument filename is the name of the file to print.</span>
 <span style="color:#0000ff;">    Argument lines is the number of lines to print from last.</span>
 <span style="color:#0000ff;">    """</span>
     lines = int(lines)
     block_size = <span style="color:#0000ff;">1024</span>
     block = <span style="color:#0000ff;">''</span>
     nl_count = <span style="color:#0000ff;">0</span>
     start = <span style="color:#0000ff;">0</span>
     fsock = file(filename, <span style="color:#0000ff;">'rU'</span>)
     <span style="color:#000080;font-weight:bold;">try</span>:
         <span style="color:#008800;font-style:italic;">#seek to end</span>
         fsock.seek(<span style="color:#0000ff;">0</span>, <span style="color:#0000ff;">2</span>)
         <span style="color:#008800;font-style:italic;">#get seek position</span>
         curpos = fsock.tell()
         <span style="color:#000080;font-weight:bold;">while</span>(curpos &gt; <span style="color:#0000ff;">0</span>): <span style="color:#008800;font-style:italic;">#while not BOF</span>
             <span style="color:#008800;font-style:italic;">#seek ahead block_size+the length of last read block</span>
             curpos -= (block_size + len(block));
             <span style="color:#000080;font-weight:bold;">if</span> curpos &lt; <span style="color:#0000ff;">0</span>: curpos = <span style="color:#0000ff;">0</span>
             fsock.seek(curpos)
             <span style="color:#008800;font-style:italic;">#read to end</span>
             block = fsock.read()
             nl_count = block.count(<span style="color:#0000ff;">'</span><span style="color:#0000ff;">n</span><span style="color:#0000ff;">'</span>)
             <span style="color:#008800;font-style:italic;">#if read enough(more)</span>
             <span style="color:#000080;font-weight:bold;">if</span> nl_count &gt;= lines: <span style="color:#000080;font-weight:bold;">break</span>
         <span style="color:#008800;font-style:italic;">#get the exact start position</span>
         <span style="color:#000080;font-weight:bold;">for</span> n <span style="font-weight:bold;">in</span> range(nl_count-lines+<span style="color:#0000ff;">1</span>):
             start = block.find(<span style="color:#0000ff;">'</span><span style="color:#0000ff;">n</span><span style="color:#0000ff;">'</span>, start)+<span style="color:#0000ff;">1</span>
     <span style="color:#000080;font-weight:bold;">finally</span>:
         fsock.close()
     <span style="color:#008800;font-style:italic;">#print it out</span>
     <span style="color:#000080;font-weight:bold;">print</span> block[start:]

 <span style="color:#000080;font-weight:bold;">if</span> __name__ == <span style="color:#0000ff;">'__main__'</span>:
     import sys
     last_lines(sys.argv[<span style="color:#0000ff;">1</span>], sys.argv[<span style="color:#0000ff;">2</span>]) <span style="color:#008800;font-style:italic;">#</span><span style="font-style:italic;color:#008800;">print the last several lines of THIS file</span></div></pre>
