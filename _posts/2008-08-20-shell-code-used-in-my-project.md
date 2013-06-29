---
layout: post
title: 'Private: Shell code used in my project'
tags:
- programming
- Shell编程
status: private
type: post
published: false
meta:
  views: '5'
  _edit_last: '1'
  original_post_id: '1888'
  _wp_old_slug: '1888'
---
#########################################
#split all contigs and take only contig1#
#########################################
for file in *
do
echo processing $file
if test -d $file
then
python getcontig1.py $file/reads.all.contigs &gt;$file/contig1
fi
done

#########
#Genscan#
#########
for file in *
do
echo processing $file ...
if test -d $file
then
genscan /usr/lib/GENSCAN/Arabidopsis.smat $file/contig1 -cds -subopt -ps&gt;$file/genscan.out
fi
done

#############################################
#Get the coding sequence of A.thaliana genes#
#############################################
for file in *
do
echo processing $file ...
if test -d $file
then
python athcds.py $file&gt;$file/athcds
fi
done

########################################################
#Get the genscan-predicted coding sequences of A.lyrata#
########################################################
for file in *
do
echo processing $file ...
if test -d $file
then
python alycds_parse_genscan.py $file
fi
done

##########################################
#Catenate athcds and alycds if both exist#
##########################################
#for file in *
#do
#echo processing $file ...
#  if test -d $file
#  then
#    if test -s $file/athcds &amp;&amp; test -s $file/alycds
#    then
#      cat $file/athcds $file/alycds&gt;$file/cdsall
#    fi
#    if test ! -s $file/alycds
#    then
#      echo $file
#    fi
#  fi
#done

for file in *
do
if test -d $file
then
i=1
while [ $i -le 3 ]  #has been tested that at most 3 cds are predicted by GENSCAN
do
if test -s $file/alycds_$i &amp;&amp; test -s $file/athcds
then
cat $file/athcds $file/alycds_$i&gt;$file/cdsboth_$i
fi
i=$((i+1))
done
fi
done

#########################################################################################
#align all cds if file cdsall exists, and convert clustal format to aligned fasta format#
#########################################################################################
for file in *
do
if test -d $file
then
i=1
while [ $i -le 3 ]  #has been tested that at most 3 cds are predicted by GENSCAN
do
if test -s $file/cdsboth_$i
then
clustalw -infile=$file/cdsboth_$i
python clw2afa.py $file/cdsboth_$i.aln &gt;$file/cdsboth_$i.afa
fi
i=$((i+1))
done
fi
done

###################################################
#find the corresponding miRNA for each target gene#
###################################################
for file in *
do
if test -d $file
then
python pair_miRNA_target.py $file
fi
done

###########################
four_alignment_result summary
###########################
for file in *
do
echo processing $file
if test -d $file
then
if test -e $file/four_alignment_result
then
python four_alignment_summary.py $file/four_alignment_result &gt;&gt;summary
fi
done
