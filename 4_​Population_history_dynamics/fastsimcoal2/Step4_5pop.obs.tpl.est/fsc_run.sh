#!/bin/bash
PREFIX="5pop.bctools"

for i in {1..30}; do
    mkdir "run${i}"
    cd "run${i}"
    ln -s ../${PREFIX}* ./
    nohup fsc28 -t ${PREFIX}.tpl -e ${PREFIX}.est -m -0 -C 10 -n 200000 -L 50 -s 0 -M -c 0 -q  &
    cd ..
    if ((i % 6 == 0)); then
        wait
    fi
done
wait
