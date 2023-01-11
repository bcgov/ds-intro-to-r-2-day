#!/bin/bash

reg="[0-9]{2}"

for x in ./../ds-intro-to-r-2-day/*.Rmd
do
  if ! [[ $x =~ $reg ]]
  then
    continue
  fi

  x_out=${x/.\/..\/ds-intro-to-r-2-day\/}
  x_out=${x_out/.Rmd/.R}
  echo "creating ${x_out}"

  sed -E \
    -e '/^(>|#)/ !d' \
    -e '/<details>/,/<\/details>/d' \
    -e 's/^(##)(.*)$/\1\2 ----------\n\n\n/' \
    -e 's/^(###)(.*)(----------\n\n\n)$/\1\2/' \
    $x > tmpfile.txt

   sed -E \
    -e '1s/^(#)(.*)$/######### \2 #########/' \
    -e '/^#([[:alnum:]])/d' \
    -e 's/^>/#/' \
    -e 's/(### Challenge [0-9])(.*)/#\1/' \
    -e '/^(#)$/d' \
    tmpfile.txt > $x_out  

done

rm tmpfile.txt


