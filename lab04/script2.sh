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
touch $1/A/1.jpg
touch $1/A/B/2.png
touch $1/C/3.png
touch $1/C/D/4.txt
touch $1/C/D/E/5.txt
touch $1/C/D/E/6.jpg
touch $1/C/7.txt

# a) Displaying .png and .jpg files with write privilages using following format: "canonical_path|date|time" and passing it to the result.dat file.
echo "a)"
find ./$1 \( -name *.jpg -or -name *.png \) -perm -200 | while read file1
do 
	output="$(realpath $file1)|$(date -r $file1 +%D)|$(date -r $file1 +%T)"
	echo $output | tee -a ./$1/result.dat
done

# b) Getting the file name without extension and the minute of last modification.
echo "b)"
for line in `cat ./$1/result.dat`
do
	minute=$(date -r ./$1/result.dat +%M)	
	output=$(echo $line | rev | cut -d "|" -f 3 | cut -d "." -f 2 | cut -d "/" -f 1)" "$minute
	echo $output

done
