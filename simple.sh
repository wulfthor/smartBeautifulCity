#!/bin/bash

. /usr/local/lib/bashlib

echo "Content-type: text/html"
echo ""

cnt=0
echo "<html><title>$1</title><body><h2>$1</h2>"
cd /Library/WebServer/Documents/data/$1
echo "<table><tr>"
ls *jpg | while read x; do cnt=$(( cnt +1 )); 
res=$((cnt % 3))

if [ $res -eq 0 ]; then
  echo "</tr>"
  echo "<tr>"
  echo "<td><a href=\"http://localhost/data/$1/$x\"><img src=\"http://localhost/data/$1/$x\" width=230 height=200></a></td> "
else 
  echo "<td><a href=\"http://localhost/data/$1/$x\"><img src=\"http://localhost/data/$1/$x\" width=230 height=200></a></td> "
fi
done
echo "</tr></table>"

echo "<body><p>test</p></body></html>"
