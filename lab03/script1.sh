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

# Deleting the current content of catalog.
rm -rf $1/*

# Creating the catalog structure.
mkdir -p $1/A/B
mkdir -p $1/C/D/E
touch $1/A/plik1.txt
echo "Test 1" >> $1/A/plik1.txt
touch $1/A/B/plik2.txt
echo "Test 2" >> $1/A/B/plik2.txt
touch $1/C/plik3.txt
echo "Test 3" >> $1/C/plik3.txt
touch $1/C/D/E/plik4.txt
echo "Test 4" >> $1/C/D/E/plik4.txt

# Creating the symlinks.
path=$(realpath $1/C/plik3.txt)
ln -s $path $1/A/link_bez_plik_plik3.txt
path=$(realpath $1/A/B/plik2.txt)
ln -s $path $1/C/link_bez_plik_plik2.txt
ln -s ./plik1.txt $1/A/link_plik1.txt
ln -s ../../../A/B/plik2.txt  $1/C/D/E/link_plik_plik2.txt
ln -s ../../C/plik3.txt $1/A/B/link_plik_plik3.txt
