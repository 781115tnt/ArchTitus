#!	/bin/bash

#$1 list of keywords, separated by a space
#$2 folder
#$3 sub folder

catFolder="./CATEGORIES"

if [ -z "$2" ]
then
	echo "ERROR - EMPTY FOLDER NAME"
	exit
fi

destFolder="$catFolder/$2"

if [ -n "$3" ]
then
	destFolder="$destFolder/$3"	
fi

echo $destFolder

mkdir -p "$destFolder"

for kw in $( echo $1)
do
	for f in $kw\ * $kw,* $kw.* $kw-* *\ $kw\ * *\ $kw,* *\ $kw.* *\ $kw-*
	do 
		if [[ ! -d  "$f" && -f "$f" ]]; then
			ln -sr  "./$f" "$destFolder/$f"
		fi
	done
done
