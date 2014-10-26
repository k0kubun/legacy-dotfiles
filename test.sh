PACKAGES="
  a b
  c
"

while read line; do
  echo LINE: $line
done <<< $PACKAGES
