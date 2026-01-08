#!/bin/bash

min_number=0
max_number=0

for index in {1..20}; do
    while [[ true ]]; do
        read -p "($(printf %02d $index)/20) Enter a number: " number

        if ! [[ $number =~ ^[0-9]+$ ]]; then
            echo "ERROR: Number is not valid!"
            continue
        fi

        if [[ $index -eq 1 ]]; then
            min_number=$number
            max_number=$number
        fi

        if [[ $number -gt $max_number ]]; then
            max_number=$number
        fi
        if [[ $number -lt $min_number ]]; then
            min_number=$number
        fi

        break
    done
done

echo "MAX: $max_number"
echo "MIN: $min_number"
