#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

function logHeader(){
    echo -e "\n"
    header=`echo $1 | tr [a-z] [A-Z]`
    echo -e "******* $header *******\n"
}

function logMessage(){
    ts=`date '+%Y-%m-%d %H:%M:%S'`
    echo "$ts $1"
}
