# ! /bin/bash

# Check if no. of arguments is correct.
if [ $# -lt 1 ]
then
   echo "Error! Insufficient no. of arguments."
   exit 1
fi

# Check if given catalog exists.
if [ ! -d $1 ]
then
   echo "Error! The first argument must be an existing directory within this scope."
   exit 1
fi

# Deleting current content of the given catalog.
rm -rf $1/*

# Creating the catalog structure.
mkdir -p $1/A/B
mkdir -p $1/C/D/E
touch $1/A/test_jda921.txt
touch $1/A/B/test_92dad2.txt
touch $1/C/test_dad22.txt
touch $1/C/D/test_21nf123.txt
touch $1/C/D/E/test_kv28f.txt
touch $1/C/D/E/test_ad902jd.txt
touch $1/C/test_mzje92k.txt

# a) Finding files that start with "test", sorting those files and displaying the last four.
echo "a)"
find ./$1 -name test* | rev | cut -d "/" -f 1 | rev | sort | tail -n 4

# b) Finding .txt files within max depth of 2 and utilizing while loop in order to display canonical paths translating "/" to "|".
echo "b)"
find ./$1 -maxdepth 2 -name *.txt | while read file1
do
	realpath $file1 | tr '/' '|'
done

# c) Displaying and deleting files older than 1 min or smaller than 1 kB.
echo "c)"
find ./$1 -type f -mmin +1 -or -size -1k
find ./$1 -type f -mmin +1 -or -size -1k -exec rm -f {} \;

