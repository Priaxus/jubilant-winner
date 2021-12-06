#!/bin/bash

#       compare-hash-files.sh    
#   ------------------------------
#   AUTHOR:                     EP
#   DATE WRITTEN:      16 Oct 2021

if [ "$1" = "help" ];
then
    echo -e "\033[1;92mCorrect formatting of a command:\033[0m"
    echo -e "\033[91m./compare-hash-files.sh \033[93mHashsetContainingSearchTargets \033[94mHashsetToBeScanned\033[0m\n"
    exit 0
fi

hashsetToLookFor=$1
hashsetToBeScanned=$2

echo -e "\033[1;97mSearching ${hashsetToBeScanned} for matches in ${hashsetToLookFor}\033[0m\n"

while read line; 
do
    searchPhrase=$(echo "${line}" | cut -f 1 -d " ")
    echo -en "\033[1;94mSearching:\t\033[0m${line}\r"

    if grep -q ${searchPhrase} ${hashsetToLookFor}; then
        file=$(echo "${line}" | cut -f 3 -d " ")
        echo -en "\033[93;1mMatch:     \t\033[0m${searchPhrase}  "
        echo -e "\033[43;30;1m${file}\033[0m"
        $(echo "${line}" >> comparison-output-file)
    fi
done <$hashsetToBeScanned
for i in {1..150};
do
    echo -n " "
done
echo -e "\r\033[92mSearch Complete\033[0m\n"