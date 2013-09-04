---
layout: post
title: Python没有switch语句的解决方法
tags:
- programming
- python
status: publish
type: post
published: true
meta:
  views: '2354'
  _wp_old_slug: python%e6%b2%a1%e6%9c%89switch%e8%af%ad%e5%8f%a5%e7%9a%84%e8%a7%a3%e5%86%b3%e6%96%b9%e6%b3%95
---
其他语言中，switch语句大概是这样的
<pre><font color="#339966">switch (var)
{
    case value1: do_some_stuff1();
    case value2: do_some_stuff2();
    ...
    case valueN: do_some_stuffN();
    default: do_default_stuff();
}</font></pre>
而python本身没有switch语句，解决方法有以下3种:

<strong>A.使用dictionary</strong>
<pre><font color="#3366ff">values = {
           value1: do_some_stuff1,
           value2: do_some_stuff2,
           ...
           valueN: do_some_stuffN,
         }
values.get(var, do_default_stuff)()</font></pre>
<pre>具体请参考: <a href="http://www.mustap.com/pythonzone_post_224_python-switch-statement" title="Read entry: Python switch statement">Python switch statement</a></pre>
<pre>这个方法的缺点是:我不知道do_some_stuff是不是允许多个语句，如何实现，</pre>
<pre>也许是可以的，我不知道-.-</pre>
<pre><strong>B.使用lambda</strong></pre>
<pre>在PHP中，</pre>
<pre><font color="#339966"><code class="php">switch ($value) {
    case 'a':
        $result = $x * 5;
        break;
    case 'b':
        $result = $x + 7;
        break;
    case 'c':
        $result = $x - 2;
        break;
}</code> </font></pre>
<pre>在python中:</pre>
<pre><font color="#3366ff"><code class="python">result = {
  'a': lambda x: x * 5,
  'b': lambda x: x + 7,
  'c': lambda x: x - 2
}[value](x)</code> </font></pre>
<pre>具体参考: <a href="http://simonwillison.net/2004/May/7/switch/" target="_blank">Switch statements in Python</a></pre>
<pre><strong>C.<a href="http://aspn.activestate.com/ASPN/Cookbook/Python/Recipe/410692" target="_blank">Brian Beck</a>提供了一个类 switch 来实现其他语言中switch的功能</strong></pre>
<pre><font color="#3366ff"><font color="#ff00ff"><span class="syntaxcomment"># This class provides the functionality we want. You only need to look at</span>
<span class="syntaxcomment"># this if you want to know how this works. It only needs to be defined</span>
<span class="syntaxcomment"># once, no need to muck around with its internals.</span><span class="syntaxkeyword"/></font><span class="syntaxkeyword"/></font></pre>
<pre><font color="#3366ff"><span class="syntaxkeyword">class</span> <span class="syntaxname">switch</span>(object):
    <span class="syntaxkeyword">def</span> __init__(self, value):
        self.value = value
        self.fall = False

    <span class="syntaxkeyword">def</span> __iter__(self):
        <span class="syntaxstring">"""Return the match method once, then stop"""</span>
        yield self.match
        <span class="syntaxkeyword">raise</span> StopIteration

    <span class="syntaxkeyword">def</span> match(self, *args):
        <span class="syntaxstring">"""Indicate whether or not to enter a case suite"""</span>
        <span class="syntaxkeyword">if</span> self.fall <span class="syntaxkeyword">or</span> <span class="syntaxkeyword">not</span> args:
            <span class="syntaxkeyword">return</span> True
        <span class="syntaxkeyword">elif</span> self.value <span class="syntaxkeyword">in</span> args: <span class="syntaxcomment"># changed for v1.5, see below</span>
            self.fall = True
            <span class="syntaxkeyword">return</span> True
        <span class="syntaxkeyword">else</span>:
            <span class="syntaxkeyword">return</span> False

</font><font color="#ff00ff"><span class="syntaxcomment"># The following example is pretty much the exact use-case of a dictionary,</span>
<span class="syntaxcomment"># but is included for its simplicity. Note that you can include statements</span>
<span class="syntaxcomment"># in each suite.</span>
</font><font color="#3366ff">v = <span class="syntaxstring">'ten'</span>
<span class="syntaxkeyword">for</span> case <span class="syntaxkeyword">in</span> switch(v):
    <span class="syntaxkeyword">if</span> case(<span class="syntaxstring">'one'</span>):
        <span class="syntaxkeyword">print</span> 1
        <span class="syntaxkeyword">break</span>
    <span class="syntaxkeyword">if</span> case(<span class="syntaxstring">'two'</span>):
        <span class="syntaxkeyword">print</span> 2
        <span class="syntaxkeyword">break</span>
    <span class="syntaxkeyword">if</span> case(<span class="syntaxstring">'ten'</span>):
        <span class="syntaxkeyword">print</span> 10
        <span class="syntaxkeyword">break</span>
    <span class="syntaxkeyword">if</span> case(<span class="syntaxstring">'eleven'</span>):
        <span class="syntaxkeyword">print</span> 11
        <span class="syntaxkeyword">break</span>
    <span class="syntaxkeyword">if</span> case(): <span class="syntaxcomment"># default, could also just omit condition or 'if True'</span>
        <span class="syntaxkeyword">print</span> <span class="syntaxstring">"something else!"</span>
        <span class="syntaxcomment"># No need to break here, it'll stop anyway</span></font></pre>