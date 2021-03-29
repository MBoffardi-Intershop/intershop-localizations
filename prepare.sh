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
        # cat the file by concatenating multi-row translations
        # first sed removes the DOS trailing endline, if existing
        # the awk "if"  detects a line ending with \ removes it and output it without the line separator
        cat $locfile | sed -e 's/\r$//g' | awk '{if (sub(/\\$/,"")) printf "%s", $0; else print $0}' >>$out.tmp
        cl=$(cat $locfile | wc -l)
        let lines=lines+cl
    done
    # Sorts the localization keys and removes empty lines
    sort $out.tmp | grep '^[[:blank:]]*[^[:blank:]#;]' > $out
    rm $out.tmp
    echo "\nDone.\nProcessed $lines translation keys in $files files, removing comments and empty lines."
    ls -l $out
done
