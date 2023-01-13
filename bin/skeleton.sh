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
  x_out=bin/"$x_out"
  echo "removing old ${x_out} from course notes folder"
  rm $x_out

# delete lines which do not start with hash or caret
# delete lines in the challenges between details tags
# add line of dashes below section header lines
# remove trailing dashes under challenge header lines

# surround script title with mulitple hashes`
# lines in challenges still start with right angle bracket.  replace with hash
# remove trailing information on challenge times
# remove start and end chunk lines
# remove blank lines starting with a hash

  echo "creating new ${x_out} in course notes folder"
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
    tmpfile.txt > $x_out

rm tmpfile.txt

done
