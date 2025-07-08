#!/bin/bash

# Read the file line by line
while IFS= read -r i
do
  # Run fastp for each individual
nohup  fastp -i raw_reads/${i}_1.fastq.gz -I raw_reads/${i}_2.fastq.gz \
        -o clean_reads/${i}.clean_1.fq.gz -O clean_reads/${i}.clean_2.fq.gz \
        --length_required 60 --detect_adapter_for_pe \
        --qualified_quality_phred 20 --unqualified_percent_limit 20 \
        --n_base_limit 5 --thread 8 > clean_reads/${i}.log 2>&1 & 
done < sample.id.txt
