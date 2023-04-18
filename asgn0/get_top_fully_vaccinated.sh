#!/bin/bash

# Check if the number of arguments is correct
if [[ $# -ne 2 ]]; then
  echo "Invalid number of arguments"
  exit 1
fi

# Check if the input file exists and is readable
if [[ ! -f "$1" || ! -r "$1" ]]; then
  echo "Cannot find/read $1"
  exit 1
fi

# Extract the top-k counties with unique fully vaccinated percentage
k="$2"
awk -F',' 'NR > 1 {print $4 "," $5 "," $6}' "$1" | sort -t ',' -k3nr -u -k1 | head -n "$k"

exit 0

