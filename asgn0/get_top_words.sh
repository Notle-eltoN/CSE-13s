#!/bin/bash
# Author: Elton Chang
# To detect and return the top K most frequent words found in a given text
# Check if contain required argument 

filename=$1
k=$2

clean_file=$(mktemp)

stop_words="stopwords.txt"

tr '[:upper:]' '[:lower:]' < "$filename" | tr -d '[:punct:]' | tr -s '[:space:]' '\n' |sort|uniq|grep -vFwxf "$stop_wrods" > "$cleanfile"

result=$(cat "$clean_file" |tr '[:upper:]' '[:lower:]' | sort | uniq -c |sort -rn |awk '{if(NR<='"$k"') print $2;else if($1==last) {print $2} else {exit}}{last=$1}' |sort)

echo "$result"
rm "$clean_file"






