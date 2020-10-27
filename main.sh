#!/bin/bash
URL_LIST="$1"
data_dir="/data"
function notify {
    python3 /code/message.py "$1"
}

function gospider-exec {
    gospider -S "$data_dir/$URL_LIST" --depth 2 --threads 64 --concurrent 16 --output "$data_dir/gospider" &> /data/debug-gospider.txt
}

function main {
    gospider-exec
}

{ time main ; } 2> time.txt
t=$(cat time.txt | grep real | cut -d " " -f2)
notify "Gospider for $(cat $data_dir/$URL_LIST | wc -l) URLs in $t"
