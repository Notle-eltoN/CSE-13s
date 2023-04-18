#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <log_file>"
  exit 1
fi

log_file=$1

# Calculate the average content size and count of unique response codes
content_size_sum=0
response_codes=()

while read -r line; do
  # Split the line into fields
  fields=($line)

  # Extract the content size and response code from the fields
  content_size=${fields[9]}
  response_code=${fields[8]}

  # Convert "-" content sizes to 0
  if [ "$content_size" = "-" ]; then
    content_size=0
  fi

  # Add the content size to the sum
  content_size_sum=$((content_size_sum + content_size))

  # Add the response code to the array of unique response codes
  if [[ ! " ${response_codes[@]} " =~ " ${response_code} " ]]; then
    response_codes+=("$response_code")
  fi
done < "$log_file"

# Calculate the average content size and round to the nearest integer
average_content_size=$((content_size_sum / $(wc -l < "$log_file")))
echo "Average content size: $average_content_size bytes"

# Print the count of unique response codes
echo "Number of unique response codes: ${#response_codes[@]}"
