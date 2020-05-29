# ! /bin/bash

# Checking the integrity of script arguments
# Checking the no. of arguments
if [ $# -lt 2 ]
then
   echo "Error! Insufficient no. of arguments."
   exit 1;
fi

# Checking if given directories exist
if [ ! -d $1 -o ! -d $2 ]
then
   echo "Error! At least one of the provided directories does not exist within this scope."
   exit 1;
fi

# A loop iterating over elements from $2 checking if they're files and if its name is duplicated in $1. If so, it gets deleted from $1.
for i in `ls $2`
do
   if [ -f $2/$i -a -f $1/$i ]
   then
      echo "Removing duplicate file $i from directory $1."
      rm $1/$i
   fi
done
