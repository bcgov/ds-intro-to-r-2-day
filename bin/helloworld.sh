#!bin/bash

reg="[0-9]{2}"
rpl="---------------------------------------------------------------------"

for x in *.Rmd
do
  if ! [[ $x =~ $reg ]]
  then
    continue
  fi

  x_out=${x/.Rmd/.R}
  x_out=${x_out}
  echo "creating ${x_out} from ${x}"

  sed -E \
    -e '/^(>|#)/ !d' \
    -e '/<details>/,/<\/details>/d' \
    -e 's/^(##)(.*)$/\1\2\n## '"$rpl"' \n\n\n\n/' \
    $x > tmpfile.txt

   sed -E \
    -e '1s/^(#)(.*)$/######### \2 #########/' \
    -e '/^#([[:alnum:]])/d' \
    -e 's/^>/#/' \
    -e 's/(### Challenge [0-9])(.*)/#\1/' \
    -e '/^(# `)/d' \
    -e '/^#([[:space:]])$/d' \
    -e 's/(#### Challenge [0-9]\n)//' \
    tmpfile.txt > tmpfile2.txt

mv tmpfile2.txt bin/

rm tmpfile*


done
