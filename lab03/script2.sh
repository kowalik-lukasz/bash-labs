# ! bin/bash


catalog=Test
# Run the previous script.
./skrypt1.sh $catalog

# Copying the simlinks.
cp -P $catalog/A/link_plik1.txt $catalog/A/link_bez_plik_plik3.txt $catalog/C/D/E/

# the symlink link_plik1.txt is no longer a correct link, whreas link_bez_plik_plik3.txt is correct due to the usage of canonical path.

# Deleting the file under ./A/link_plik1.txt
rm "$(readlink -f $catalog/A/link_plik1.txt)"

check_catalog () {
   cd $1
   for i in `ls`
   do
      if [ -d $i ]
      then
         check_catalog $i
      else
         path=$(readlink $i)
         # checked_target=$(basename $path)
	 # command below instead of using basename due to an unresolved error - basename missing operand
         checked_target=$(echo $path | rev | cut -d "/" -f 1 | rev) 
         if [ "$checked_target" == "plik3.txt" ]
         then
            echo $(realpath $i)
         fi
      fi

      
   done
   cd ..
}

check_catalog $catalog

# Finding all symlinks to plik3.txt
