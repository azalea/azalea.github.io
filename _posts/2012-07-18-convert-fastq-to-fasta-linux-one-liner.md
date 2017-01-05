---
layout: post
title: Convert fastq to fasta - Linux one-liner
tags:
- bioinformatics
- shell
- sed
- awk
---

    awk 'NR % 4 == 1 || NR % 4 == 2' myfile.fastq | sed -e 's/@/>/' > myfile.fasta

我就是来吐槽神awk和sed的
