# ! /bin/bash

# a) print info about processes that consume less than 10% of CPU.
echo "a)"
ps aux | awk ' $3 < 10 {print "Uzytkownik " $1 " ma uruchomiony proces o PID " $2 " - CPU = " $3 ", MEM = " $4} '

# b) print if COMMAND fields contain "/usr/".
echo "b)"
ps aux | awk ' {for(i=11; i<=NF; i++)  {if($i ~ /usr/) print "Uzytkownik " $1 " ma uruchomiony proces COMMAND: " $i}} '

# c) Sum of CPU and memory usage.
echo "c)"
ps aux | awk ' NR>1{cpu_sum += $3; mem_sum += $4} END {print "Suma CPU: " cpu_sum ", Suma MEM: " mem_sum} '
# The results differ from the ones obtained using top command probably because the ps aux command displays the numerical values to one decimal place.

# d) Count processes per user.
echo "d)"
ps aux | awk ' NR>1{users[$1]++} END {for (key in users) print "Uzytkownik " key " lacznie ma uruchomionych " users[key] " procesow"} '

# e) Find users with min and max number of processes.
echo "e)"
ps aux | awk ' \ 
 NR>1{users[$1]++} \
 END {for (key in users) print "Uzytkownik " key " lacznie ma uruchomionych " users[key] " procesow"} \
 ' | awk '\
 BEGIN{min=99999999; max=$6; max_user=$2} \
 {if($6 > max){max = $6; max_user = $2}; if($6 < min){min = $6; min_user = $2}} \
 END{print "Uzytkownik " max_user " ma najwiecej uruchomionych procesow: " max ". Uzytkownik " min_user " ma najmniej uruchomionych procesow: " min}\
 '
