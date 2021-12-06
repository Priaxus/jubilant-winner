#!/bin/bash

#       search-for-renames.sh         
#   ------------------------------
#   AUTHOR:                     EP
#   DATE WRITTEN:      16 Oct 2021

hashset=$1
archiveToSearch=$2
targetFile=$3

if [ "$hashset" = "help" ];
then

    echo -e "\033[1;92mCorrect formatting of a command:\033[0m"
    echo -e "\033[91m./search-for-renames.sh \033[93mHashsetContainingDeletedFile \033[94mHashsetToSearchForDeletedFile \033[95mDeletedFileName\033[0m\n"
    exit 0

fi

hash=$(cat ${hashset} | grep ${targetFile} | cut -f 1 -d " ")

if [ "$hash" = "" ];
then

    echo -e "\n\033[1;41;30mHash of target file ${targetFile} could not be found in ${hashset}\033[0m\n"
    exit 0

else

    echo -e "\n\033[1mHash of target file \033[92m${targetFile}\033[0;1m as stored in ${hashset}:\033[0m \033[91m${hash}\033[0m"
    echo -e "Searching for this \033[91mhash\033[0m in \033[1;95m${archiveToSearch}\033[0m..."

    if grep -q ${hash} ${archiveToSearch}
    then
    
        searchResult=$(cat ${archiveToSearch} | grep ${hash})
        file=$(echo "${searchResult}" | cut -f 3 -d " ")

        if [ "$targetFile" = "$file" ];
        then
        
            echo -e "Target file was never deleted and remains intact with the same name as when \033[96m${hashset}\033[0m was generated\n"
            exit 0
        
        fi
        
        echo -e "Renamed file found!"
        echo -e "File is: \033[42;1;30m${file}\033[0m\n"
    
    else
    
        echo -e "No renamed file found - file has probably been deleted since \033[96m${hashset}\033[0m was generated\n"
    
    fi

fi