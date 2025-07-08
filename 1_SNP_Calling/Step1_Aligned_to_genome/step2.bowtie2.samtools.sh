#!/bin/bash

while read -r i; do

	nohup bowtie2 -q -p 48 --sensitive-local -x Csq_v2.0 \
        -1 "../clean_reads/${i}.clean_1.fq.gz" -2 "../clean_reads/${i}.clean_2.fq.gz" | \
        samtools view -bS --threads 16 | \
        samtools sort --threads 16 -o "./${i}.sort.bam" > ${i}.log 2>&1 &

done < ../sample.id.txt

echo "All done!"
