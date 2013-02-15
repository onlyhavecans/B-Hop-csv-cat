#!/bin/bash
OUTPUT_FILE="Master.csv"

for i in *.csv; do
  if [[ $(basename $i) != $OUTPUT_FILE ]]; then
    shortName=$(echo $(basename $i) | cut -c 1-6 -)
    cat $i | tr '\r' '\n' | awk '{printf "%s,%s\n", $0, '$shortName'}' >> $OUTPUT_FILE
  fi
done
