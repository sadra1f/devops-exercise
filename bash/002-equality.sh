#!/bin/bash

# Exit and show error if arguments or enviroments are wrong
if [ -z "$1" ]; then
    echo "Usage: $0 NUMBER"
    exit 1
fi

target_number=$1

if ! [[ "$target_number" =~ ^[0-9]*$ ]]; then
    echo "Number is not valid"
    exit 1
fi

if [[ $target_number -gt 10 ]]; then
    echo "Number is greater than 10"
elif [[ $target_number -lt 10 ]]; then
    echo "Number is lower than 10"
else
    echo "Number is equal to 10"
fi
