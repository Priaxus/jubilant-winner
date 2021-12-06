#!/bin/bash

#   determine-hashing-algorithm.sh 
#   ------------------------------
#   AUTHOR:                     EP
#   DATE WRITTEN:      17 Oct 2021

if [ "$1" = "help" ];
then
    echo -e "\033[1;92mCorrect formatting of a command:\033[0m"
    echo -e "\033[91m./determine-hashing-algorithm.sh \033[93mHashset\033[0m\n"
    exit 0
fi

hashset=$1

sampleLength=$(cat ${hashset} | head -1 | cut -f 1 -d " " | wc -c)

case $sampleLength in

    33)
        echo -e "\033[1mHashing algorithm identified: \033[0;92mmd5\033[0m"
        ;;

    41)
        echo -e "\033[1mHashing algorithm identified: \033[0;92msha1\033[0m"
        ;;

    57)
        echo -e "\033[1mHashing algorithm identified: \033[0;92msha224\033[0m"
        ;;

    65)
        echo -e "\033[1mHashing algorithm identified: \033[0;92msha256\033[0m"
        ;;

    97)
        echo -e "\033[1mHashing algorithm identified: \033[0;92msha384\033[0m"
        ;;

    129)
        echo -e "\033[1mHashing algorithm identified: \033[0;92msha512\033[0m"
        ;;                

    *)
        echo -e "\033[1;91mSomething went wrong - hashing algorithm could not be determined\033[0m"
        ;;

esac