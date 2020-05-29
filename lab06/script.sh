# ! /bin/bash

curl -s https://en.wikipedia.org/wiki/Wikipedia:10,000_most_common_passwords | head -200 > most_common_pswd.html
sed -n "/123456/,/matrix/p" most_common_pswd.html > top100.txt
top100="top100.txt"

# Passwords containing numbers only.
echo "a)"
egrep "^<li>[[:digit:]]+</li>$" $top100 | wc -l

# Lower letters only.
echo "b)"
egrep "^<li>[[:lower:]]+</li>$" $top100 | wc -l

# Repeated characters only.
echo "c)"
egrep "^<li>(.)\1+</li>$" $top100 | wc -l
