# ! /bin/bash

# Checking the integrity of script arguments.
# Checking the no. of arguments
if [ $# -lt 2 ]
then
   echo "Error! Insufficient no. of arguments."
   exit 1;
fi

# Checking if given directory exists.
if [ ! -d $1 ]
then
   echo "Error! The first argument must be an existing directory within this scope."
   exit 1;
fi

# Loop checking elements from the catalog. If the element extension matches the extension provided in script's arguments the content of the file gets relocated to the summary file.
for i in `ls $1`
do
   checked_extension=$(echo $i | cut -d "." -f 2)
   model_extension=$(echo $2 | cut -d "." -f 2)
   echo $extension
   if [ $checked_extension == $model_extension ]
   then
      echo "Appending content of $i to $1-merged-files$2"
      echo "$i" >> $1/"$1-merged-files$2"
      cat $1/$i >> $1/"$1-merged-files$2"
      rm $1/$i
   fi
done
