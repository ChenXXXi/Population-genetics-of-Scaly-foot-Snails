#!/bin/bash
while read sample; do
    echo "fq2psmcfa -q20 ${sample}.fq.gz > ${sample}.diploid.psmcfa" > ${sample}.sh
    echo "psmc -N30 -t15 -r4 -p \"4+25*2+4+6\" -o ${sample}.diploid.psmc ${sample}.diploid.psmcfa" >> ${sample}.sh
    echo "nohup sh ${sample}.sh &"

done < sample.list
