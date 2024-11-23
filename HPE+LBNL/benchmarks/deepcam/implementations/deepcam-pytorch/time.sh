#!/bin/bash

# Usage:
# > parse_result.sh <path-to-log-file>

if [ $# -lt 1 ]; then
    echo "Usage:"
    echo "> parse_result.sh <path-to-log-file>"
    exit 1
fi
result_file=$1

_num_epochs=$2


run_start=$(grep "^:::MLLOG" $result_file | grep "run_start" |
            awk '{print $5}' | tr -d ',')
run_stop=$(grep "^:::MLLOG" $result_file | grep "epoch_stop" |
           grep "epoch_num\": $_num_epochs" | awk '{print $5}' | tr -d ',')
run_time=$(echo $run_start $run_stop | awk '{print ($2-$1)/1000.}')
echo "Benchmark Time: $run_time seconds"
