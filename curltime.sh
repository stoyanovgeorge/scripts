#!/bin/bash


if [ -z "$1" ];
then echo "You have not defined a valid URL! 'curltime <URL>'"
else
    curl -L -w @"$HOME"/Documents/GitHub/scripts/curl_time_format.txt -o /dev/null -s "$1";
fi
