---
layout: post
title: Convert SRA format to fastq
tags:
- bioinformatics
- format
- software
language: en
---
<a href="http://www.ncbi.nlm.nih.gov/geo/" target="_blank">NCBI GEO</a> uses SRA (Sequence Read Archive) format to store sequencing files. <a href="http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM621123" target="_blank">e.g. </a>

SRA format needs to be converted into fastq to be used as input to Bowtie, Tophat etc. Here is how:

1. Download the SRA toolkit from <a href="http://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software" target="_blank">http://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software</a>

If you are using 64-bit linux, try the <a href="http://trace.ncbi.nlm.nih.gov/Traces/sra/static/sratoolkit.2.1.4-centos_linux64.tar.gz">CentOS Linux 64 bit architecture</a> first. It is so much pain to compile from source.

2. Decompress the downloaded file, and copy the fastq-dump file to system path.

3. Convert SRA to fastq


    fastq-dump <SRA archive file>


which will create a fastq file with the same name as the SRA archive file.

References:

<a href="http://dartmouthngs.pbworks.com/w/page/34873478/SRA%20to%20fastq" target="_blank">http://dartmouthngs.pbworks.com/w/page/34873478/SRA%20to%20fastq</a>

<a href="http://www.ncbi.nlm.nih.gov/books/NBK47540/#SRA_Download_Guid_B.5_Converting_SRA_for" target="_blank">http://www.ncbi.nlm.nih.gov/books/NBK47540/#SRA_Download_Guid_B.5_Converting_SRA_for</a>
