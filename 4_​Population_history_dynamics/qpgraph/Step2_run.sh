#!/bin/bash

suffixes=("LQ" "TC" "WC" "kr_so" "on_na")

for mix_num in {0..5}; do
    for suffix in "${suffixes[@]}"; do
      echo "nohup Rscript mix.outgroup.qpgraph.R mix${mix_num} ${mix_num} ${suffix} &"
    done
done
