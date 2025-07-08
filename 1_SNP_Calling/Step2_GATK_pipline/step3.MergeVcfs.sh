#!/bin/bash
##gatk=/home/xichen/link_biosoft/gatk
reference=/home/xichen/chenxi/gatk.vcf.output/Csq.genome
indir=/home/xichen/chenxi/onnare_8/04.gatk/step4_2.output
outdir=/home/xichen/chenxi/onnare_8/04.gatk/step5.output

merge_vcfs=""

# Ensure the output directory exists
mkdir -p $outdir

for i in $(cat chr.list)
do
    merge_vcfs="${merge_vcfs}-I $indir/125.Csq.${i}.vcf.gz "
done

gatk MergeVcfs ${merge_vcfs} -O $outdir/125.Csq.all.vcf.gz
