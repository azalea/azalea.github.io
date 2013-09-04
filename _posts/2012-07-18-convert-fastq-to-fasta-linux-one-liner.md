---
layout: post
title: Convert fastq to fasta - Linux one-liner
tags:
- bioinformatics
status: publish
type: post
published: true
meta:
  _edit_last: '1'
---
<blockquote>awk 'NR % 4 == 1 || NR % 4 == 2' myfile.fastq | sed -e 's/@/&gt;/' &gt; myfile.fasta</blockquote>
我就是来吐槽神awk和sed的
