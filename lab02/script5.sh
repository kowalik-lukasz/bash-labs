# ! /bin/bash

# Sprawdzenie poprawności liczby argumentów.
if [ $# -lt 2 ]
then
   echo "Error! Insufficient no. of arguments."
   exit 1;
fi

# Sprawdzenie czy podany katalog istnieje.
if [ ! -d $1 ]
then
   echo "Error! The first argument must be an existing directory within this scope."
   exit 1;
fi

# Pętla sprawdzająca elementy z katalogu. Jeśli rozszerzenie elementu zgadza się z rozszerzeniem przekazanym w argumencie, to następuje przeniesienie zawartości do pliku całościowego.
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
