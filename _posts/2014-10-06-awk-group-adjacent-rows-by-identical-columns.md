---
layout: post
title: awk - group adjacent rows by identical columns
categories: 
tags:
- awk

language: en
---

Liang always brings me interesting quiz questions. Here is one:

>If i have a table like below:

    chr1	113438	114495	1	chr1	114142	114143
    chr1	113438	114495	2	chr1	114171	114172
    chr1	170977	174817	1	chr1	171511	171512
    chr1	170977	174817	2	chr1	171514	171515
    chr1	170977	174817	2	chr1	173545	173546

>and I would like to collapse the rows if the first 3 columns are identical to make the following output:

    chr1	113438	114495	114142,114143,114171,114172    
    chr1	170977	174817	171511,171512,171514,171515,173545,173546

>Is there any easy awk approach to do it?

Since I am so rusty at awk, I had to google around to find the solution:

    awk -F '\t' '
    $1FS$2FS$3==x{
        printf ",%s,%s", $6, $7
        next
    }
    {
        x=$1FS$2FS$3
        printf "\n%s\t%s,%s", x, $6, $7
    }
    END {
        printf "\n"
    }' test.txt
    
Assuming the input file is `test.txt`. Note that the input and output are both tab-separated.

Explanation:

`x=$1FS$2FS$3`: variable x stores the value of columns 1, 2, and 3 separated by field separator `FS`. 

Print the first part of an output line (columns 1, 2, 3, 6, 7).

For next line, if columns 1, 2, and 3 equal x, print columns 6 and 7.

References:

[Group rows in text file and aggregate corresponding rows to column](http://stackoverflow.com/questions/11389990/group-rows-in-text-file-and-aggregate-corresponding-rows-to-column)

[keeping last record among group of records with common fields (awk)](http://www.unix.com/unix-for-dummies-questions-and-answers/202715-keeping-last-record-among-group-records-common-fields-awk.html)
