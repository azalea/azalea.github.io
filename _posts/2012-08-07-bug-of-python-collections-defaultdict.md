---
layout: post
title: Bug of python collections.defaultdict() ?
tags:
- defaultdict
- programming
- python
status: publish
type: post
published: true
meta:
  _edit_last: '1'
---
<script src="https://gist.github.com/3290375.js?file=buggy_defaultdict.py"/>

Running the script gives the error:
<blockquote>Traceback (most recent call last):
File "z.py", line 39, in &lt;module&gt;
dfsloop(G)
File "z.py", line 13, in dfsloop
for v in G: # No error if "for v in G.keys():"
RuntimeError: dictionary changed size during iteration</blockquote>
However, if line 13 is changed to "for v in G.keys():", then the script runs properly!

But "for v in G" and "for v in G.keys()" should be the same. Any explanations?

<a href="http://stackoverflow.com/questions/8762819/runtimeerror-dictionary-changed-size-during-iteration-during-iteration-with-i">This thread in SO </a>talks about the same error related to the use of <a href="http://docs.python.org/library/collections.html#collections.defaultdict">collections.defaultdict()</a>.

 