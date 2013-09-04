---
layout: post
title: Install Target Finder on Mac
tags:
- bioinformatics
- bioinformatics tool
status: publish
type: post
published: true
meta:
  _edit_last: '1'
---
<a href="http://carringtonlab.org/resources/targetfinder">TargetFinder</a> predicts microRNA targets with a plant-specific scheme. To install it on Mac:

1. Download the current release of TargetFinder, now it is <a href="TargetFinder_1.6.tar.gz">Release 1.6</a>

2. Extract and read the README and INSTALL files

3. Download fasta as requested at <a href="http://fasta.bioch.virginia.edu/fasta_www2/fasta_down.shtml">http://fasta.bioch.virginia.edu/fasta_www2/fasta_down.shtml</a>

   Current version is <a href="http://faculty.virginia.edu/wrpearson/fasta/fasta3.tar.gz">fasta36</a>.

4. Extract and read the README file

5. To install the standard FASTA programs:

```bash
cd src
make -f ../make/Makefile.linux_sse2 all
```

   The executable programs will appear in ../bin

6. Make a copy of the executable fasta36 program in your PATH

   To check your system PATH:

```bash
echo $PATH
```

   Copy fasta36 to /usr/bin (for example) and rename it to fasta35 (a quick-and-dirty way to make TargetFinder work. A better way is to change line 88 of targetfinder.pl to my $fasta = "fasta36";):

```bash
sudo cp ../bin/fasta36 /usr/bin/fasta35
```

7. Run TargetFinder:
   Dir\_to\_targetfinder/targetfinder.pl -s miRNA.fa -d targets.fa
