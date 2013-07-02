---
layout: post
title: Keep uniquely mapped reads
categories: English
tags:
  - linux
  - bioinformatics
---

So you've sequenced a bunch of reads, mapped them to a reference with a short read aligner, and now you find that some reads map to multiple locations. You hate multi-mappers, so you'd like to discard them and keep only uniquely mapped reads.

Say you have your read alignment in [.sam format](http://genome.sph.umich.edu/wiki/SAM), like this:


```

1:497:R:-272+13M17D24M	113	1	497	37	37M	15	100338662	0	CGGGTCTGACCTGAGGAGAACTGTGCTCCGCCTTCAG	0;==-==9;>>>>>=>>>>>>>>>>>=>>>>>>>>>>	XT:A:U	NM:i:0	SM:i:37	AM:i:0	X0:i:1	X1:i:0	XM:i:0	XO:i:0	XG:i:0	MD:Z:37
19:20389:F:275+18M2D19M	99	1	17644	0	37M	=	17919	314	TATGACTGCTAATAATACCTACACATGTTAGAACCAT	>>>>>>>>>>>>>>>>>>>><<>>><<>>4::>>:<9	RG:Z:UM0098:1	XT:A:R	NM:i:0	SM:i:0	AM:i:0	X0:i:4	X1:i:0	XM:i:0	XO:i:0	XG:i:0	MD:Z:37
19:20389:F:275+18M2D19M	147	1	17919	0	18M2D19M	=	17644	-314	GTAGTACCAACTGTAAGTCCTTATCTTCATACTTTGT	;44999;499<8<8<<<8<<><<<<><7<;<<<>><<	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:4	X1:i:0	XM:i:0	XO:i:1	XG:i:2	MD:Z:18^CA19
9:21597+10M2I25M:R:-209	83	1	21678	0	8M2I27M	=	21469	-244	CACCACATCACATATACCAAGCCTGGCTGTGTCTTCT	<;9<<5><<<<><<<>><<><>><9>><>>>9>>><>	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:5	X1:i:0	XM:i:0	XO:i:1	XG:i:2	MD:Z:35

```
You can download [the example.sam file](/attachments/example.sam) for testing purposes.

Here is how to do it in pure Linux commmand line:

``` bash
# Before you proceed, make sure your alignment file is sorted by the read name column (or any column with a unique identifier for each read)
# Separate the read name column with "cut". The parameter of -f should be the column of the read name. This is 1 for .sam, while it is 4 for .bed
cut -f1 example.sam > reads.txt

# Count the number of occurances (i.e. mapped locations) of each read name 
uniq -c reads.txt > count.txt

# Add the count to the last column of each line. "join" merges the two files based on column 1 of the first file and column 2 of the second file. If the original file is in .bed format, use "-1 4" instead.
join  -1 1 -2 2 example.sam count.txt > example_with_count.txt

# Keep only lines with a count of 1
awk '$NF == 1' example_with_count.txt > example_unique.txt

# Remove the last column
awk '{delim = ""; for (i=1;i<=NF-1;i++) {printf delim "%s", $i; delim = OFS}; printf "\n"}' example_unique.txt > example_unique.sam
```

You are done!

Here is a shell script [keepunique.sh](https://gist.github.com/azalea/5914087) that you can download and use. 

By the way, it is officially discouraged to use uniqueness to filter reads. See [this](http://sourceforge.net/apps/mediawiki/samtools/index.php?title=SAM_FAQ#I_want_to_get_.60unique.27_alignments_from_SAM.2FBAM.) and [this](http://www.biostars.org/p/59281/). So use at your own risk.