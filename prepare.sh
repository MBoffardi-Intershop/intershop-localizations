#!/bin/sh
if [ -z $1 ] 
then
     echo "USAGE: prepare.sh <version>\nWhere <version> is one of the directories into \"originals\":."
     ls -x originals
     exit 1
fi


for app in `ls originals/$1`
do
    out="prepared/${1}_${app}_en.properties"
    echo "Processing Application $app --> $out"
    cat /dev/null >>$out.tmp
    lines=0
    files=0
    for locfile in `find originals/$1/$app -name *.properties -print`
    do
        printf "."
        let files=files+1
        cat $locfile >>$out.tmp
        cl=$(cat $locfile | wc -l)
        let lines=lines+cl
    done
    sort $out.tmp > $out
    rm $out.tmp
    echo "\nDone.\nProcessed $lines translation keys in $files files."
    ls -l $out
done
