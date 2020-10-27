#!/bin/bash
URL_LIST="$1"
DOMAIN="$2"
data_dir="/data"
function notify {
    python3 /code/message.py "$1"
}

function gospider-exec {
    gospider -S "$data_dir/$URL_LIST" --depth 2 --threads 128 --concurrent 32 --output "$data_dir/gospider" --timeout 4 --other-source
}

function main {
    gospider-exec
}

{ time main ; } 2> time.txt
t=$(cat time.txt | grep real | cut -d " " -f2)
notify "Gospider for $DOMAIN: $(cat $data_dir/gospider/* | wc -l) Lines in $t"
