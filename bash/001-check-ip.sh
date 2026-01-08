#!/bin/bash

# Exit and show error if arguments or enviroments are wrong
if [ -z "$1" ]; then
    echo "Usage: $0 IP"
    exit 1
fi

# Remove spaces and store argument
target_ip=$(echo "$1" | tr -d "[:space:]")

# Check IP to contain only numbers and dots and IP parts count to be exactly 4
if ! [[ "$target_ip" =~ ^([0-9]|\.)*$ && $(echo "$target_ip" | tr "." "\n" | wc -l) -eq 4 ]]; then
    echo "IP: NOT VALID"
    exit 1
fi

# Check each part to be less than or equal to 255
for VAR in $(echo "$target_ip" | tr "." "\n"); do
    if [[ $VAR -gt 255 ]]; then
        echo "IP: NOT VALID"
        exit 1
    fi
done

echo "IP: VALID"

ping -c 3 $target_ip &>/dev/null

if [[ $? -eq 0 ]]; then
    echo "REACHABLE: YES"
    exit 0
fi

echo "REACHABLE: NO"
