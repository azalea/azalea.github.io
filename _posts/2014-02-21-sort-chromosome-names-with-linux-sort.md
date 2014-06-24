---
layout: post
title: Sort chromosome names with Linux sort
categories: 
tags:
  - linux
  - sort
  - genomics
language: en  
---
One common task that comes up regularly when analyzing genomic data is to sort a data file by chromosome names. See the following `example.txt` file:

    chr21	Any
    chr2	Data
    chr3	Or
    chrY	Information
    chr1	Some
    chr3	Annotation
    chr10	Or
    chrX	Other

I would like the data to be in this order:

    chr1	Some
    chr2	Data
    chr3	Or
    chr3	Annotation
    chr10	Or
    chr21	Any
    chrX	Other
    chrY	Information

i.e. Chromosome names with a number come first in numerical order, followed by chromosomes names with a letter.

Let's use Linux `sort` command:

    sort example.txt

Then the data is ordered as follows:

    chr1	Some
    chr10	Or
    chr2	Data
    chr21	Any
    chr3	Annotation
    chr3	Or
    chrX	Other
    chrY	Information
    
Howver, this is not what we want. We'd like the chromosome names sorted numerically when possible. That means, chr10 should come after chr3. 

Then, let's try:

    sort -k 1.4,1 -n -s example.txt

The options are saying that to sort via a key (`-k`) starting at the 4th character in the 1st field and ending at the end of the 1st field (i.e. 1, 2, 3, 10, 21, X, Y), numerically (`-n`), and stably (`-s`).
    
The result, however, is not quite what we want:

    chrX	Other
    chrY	Information
    chr1	Some
    chr2	Data
    chr3	Or    
    chr3	Annotation
    chr10	Or
    chr21	Any
     
It correctly sorted the chromosome names with numbers, but it placed the chromosomes with letters at the beginning.

I haven't figured out how to precede letters by numbers along this path, but it turns out another option of sort `-V` comes to our rescue:     

	sort -k1,1 -V -s example.txt
	
Voilà! It amazingly works:

    chr1	Some
    chr2	Data
    chr3	Or
    chr3	Annotation
    chr10	Or
    chr21	Any
    chrX	Other
    chrY	Information	
    
What `-V` means is "natural sort of (version) numbers within text" (type `man sort` to find out), and it magically orders numbers and texts.

A side note: the Mac OS X native `sort` does not support `-V`, you'll have to [install GNU core utilities](http://apple.stackexchange.com/questions/69223/how-to-replace-mac-os-x-utilities-with-gnu-core-utilities) and use `gsort` instead.  
