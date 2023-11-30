#!/bin/bash
function log_header(){
    input=$1
    echo -e "\n******* ${input} *******\n"
}

function log_message(){
    ts=`date '+%Y-%m-%d %H:%M:%S'`
    echo "$ts $1"
}
