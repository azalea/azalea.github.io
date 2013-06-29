---
layout: post
title: Don't do things the hardest way
tags:
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
  views: '380'
---
Given a DNA sequence, say DNA = 'AATTGGCCA', count how many times a given nucleotide (e.g. 'A') appears.

I used to do this in Python:

<pre>
&gt;&gt;&gt;DNA = 'AATTGGCCA'
&gt;&gt;&gt; len(filter(lambda x: x=='A',DNA))
3
</pre>

Today, I just find out I can simply do:

<pre>
&gt;&gt;&gt; DNA.count('A')
3
</pre>

Feel silly myself, but begin to love Python even more!
