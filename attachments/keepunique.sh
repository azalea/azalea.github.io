#!/bin/bash

column= type= infile= outfile=
while getopts c:i:o: opt; do
    case $opt in 
    c)
	column=$OPTARG
	;;
    i)
	infile=$OPTARG
        ;;
    o)
	outfile=$OPTARG
	;;
    esac
done

shift $((OPTIND - 1))

if test -z $column; then
    case ${infile##*.} in
	sam)
	    column=1
            echo "Figured out the read name column as column $column by input file extenstion"
	    ;;
	bed)
            column=4
            echo "Figured out the read name column as column $column by input file extenstion"
	    ;;
	*)
	    column=1
	    echo "Could not figure out the read name column by input file extension. Use column $column."
	    ;;
    esac
fi

cut -f $column $infile | uniq -c > count.tmp

if test -z $outfile; then
    join -1 $column -2 2 $infile count.tmp | awk '$NF == 1' |
    awk '{delim = ""; for (i=1;i<=NF-1;i++) {printf delim "%s", $i; delim = OFS}; printf "\n"}'
else
    join -1 $column -2 2 $infile count.tmp | awk '$NF == 1' |
    awk '{delim = ""; for (i=1;i<=NF-1;i++) {printf delim "%s", $i; delim = OFS}; printf "\n"}' > $outfile
fi    
rm count.tmp
