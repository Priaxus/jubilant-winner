#!/bin/bash

#           hmac-lister.sh
#   ------------------------------
#   AUTHOR:                     EP
#   DATE WRITTEN:      25 Oct 2021

secretKey="abcdefgh12345678"
hashingAlgorithm=$1

if [ "$hashingAlgorithm" = "help" ];
then

    echo -e "\033[1;92mCorrect formatting of a command:\033[0m"
    echo -e "\033[91m../hmac-lister.sh \033[93mHashingAlgorithm\033[0m"
    echo -e "This script should be run from within the 'files' directory (note the double dot in the line above)\n"
    exit 0

fi

for file in *; do

    searchPhraseA=$(cat ${file} | openssl dgst -${hashingAlgorithm} -hmac ${secretKey} | cut -f 2 -d " ")
    searchPhraseB=$(echo ${searchPhraseA} | base64)
    searchPhraseC=$(cat ${file} | openssl dgst -${hashingAlgorithm} -binary -hmac ${secretKey} | base64)
    echo -en "\033[1;94mSearching: \033[0m${file}                    \r"

    $(echo "${file}: ${searchPhraseA}" >> hmacs)
    $(echo "${file}: ${searchPhraseB}" >> hmacs)
    $(echo -e "${file}: ${searchPhraseC}\n\n" >> hmacs)

done

for i in {1..150};
do
    echo -n " "
done

echo -e "\r\033[92mList 'hmacs' Generated\033[0m\nYou should now use 'grep -Ff f0000 hmacs' to find the file\n"