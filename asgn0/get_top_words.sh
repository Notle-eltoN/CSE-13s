#!/bin/bash


filename=$1
k=$2


# get the list of stopwords
stopwords=$(cat stopwords)

# convert all words to lowercase and remove stopwords
words=$(tr -cs '[:alpha:]' '[\n*]' < $filename | tr '[:upper:]' '[:lower:]' | grep -v -w -F "$stopwords")

# count the frequency of each word and output the top K words
echo "$words" | sort | uniq -c | sort -rn | awk '{print $2,$1}' | sort -k2rn -k1 | head -n $k | awk '{print $1}'
