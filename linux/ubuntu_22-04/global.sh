#!/bin/bash
function logHeader(){
    echo -e "\n"
    header=`echo $1 | tr [a-z] [A-Z]`
    echo -e "******* $header *******\n"
}

function logMessage(){
    ts=`date '+%Y-%m-%d %H:%M:%S'`
    echo "$ts $1"
}
