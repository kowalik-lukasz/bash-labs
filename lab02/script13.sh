# ! /bin/bash

# Sprawdzenie poprawności liczby argumentów.
if [ $# -lt 2 ]
then
   echo "Error! Insufficient no. of arguments."
   exit 1;
fi

# Sprawdzenie czy podane katalogi istnieją.
if [ ! -d $1 -o ! -d $2 ]
then
   echo "Error! At least one of the provided directories does not exist within this scope."
   exit 1;
fi

# Pętla sprawdzająca czy dany element z $2 jest plikiem oraz czy jego nazwa powiela się w $1. Jeśli tak, zostaje usunięty z $1.
for i in `ls $2`
do
   if [ -f $2/$i -a -f $1/$i ]
   then
      echo "Removing duplicate file $i from directory $1."
      rm $1/$i
   fi
done
