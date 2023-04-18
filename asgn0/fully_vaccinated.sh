#!/bin/bash

# Check if the number of arguments is 2
if [ "$#" -ne 2 ]; then
  echo "Invalid number of arguments"
  exit 1
fi

# Check if covidVaccines.csv is a readable file
if [ ! -r "$1" ]; then
  echo "Cannot find/read covidVaccines.csv"
  exit 1
fi

# Extract the county name, state, and completeness_pct from the csv file, sort by completeness_pct in decreasing order and then by county name in ascending order.
# Take the first k entries and print the results.
tail -n +2 "$1" | sort -t ',' -k 3nr -k 1 | head -n "$2" | awk -F ',' '{printf "%s,%s,%.1f\n", $2, $3, $4}'
