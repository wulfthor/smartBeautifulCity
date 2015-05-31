#!/bin/bash
qtype=$1
qstring=$2
qnumber=$3

# example:
#cmd.sh title_first vej 100

if [ $# -eq 0 ]; then
  echo "usage cmd <qtype> <qstring> <qnumber>"
  exit
fi

curl http://solr.smk.dk:8080/solr/prod_all_dk/select?q=$qtype:$qstring\&wt=json\&rows=$qnumber\&indent=on -s | python -mjson.tool | grep http | cut -d\" -f4 | while read x; do curl -O $x; done
ls *jpg | grep % | while read x; do a=$(( $RANDOM % 40 ));sudo mv $x Ab${a}.jpg; done
sudo mkdir /Library/WebServer/Documents/data/$2
sudo mv *jpg /Library/WebServer/Documents/data/$2

