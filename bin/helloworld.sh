#!bin/bash

reg="[0-9]{2}"
rpl="---------------------------------------------------------------------"

for x in *.Rmd
do
  if ! [[ $x =~ $reg ]]
  then
    continue
  fi

  x_out=${x/ds-intro-to-r-2-day\//}
  x_out=${x_out/.Rmd/.R}
  echo "creating ${x_out} from ${x}"

done
