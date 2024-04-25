#!/bin/bash

# Check if a file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File $filename not found."
    exit 1
fi

# Process the file, count occurrences of each word
# Convert all words to lowercase to treat them case-insensitively
# Use tr to convert spaces and punctuation to newlines
# Use sort and uniq -c to count occurrences of each word
# Use sort -nr to sort by count in descending order
# Use head -n 5 to get the top 5 most frequent words
cat "$filename" | tr -sc '[:alnum:]' '\n' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -n 5
