#!/bin/bash

#        find-not-in-list.sh
#   ------------------------------
#   AUTHOR:                     EP
#   DATE WRITTEN:      17 Oct 2021

if [ "$1" = "help" ];
then
    echo -e "\033[1;92mCorrect formatting of a command:\033[0m"
    echo -e "\033[91m./find-not-in-list.sh \033[93mHashsetOfAllFilesInArchive\033[0m\n"
    exit 0
fi

hashset=$1

$(cat ${hashset} | cut -f 3 -d " " > listofallfiles)

while read line; do

    echo -en "\033[1;94mSearching:\t\033[0m${line}\r"

    if grep -q ${line} allgoodsandbads; then

        echo -en "Not match\r"

    else

        echo -e "\033[93;1mNo Match:   \t\033[0m${line}"
        $(echo "${line}" >> FINAL)

    fi

done <listofallfiles