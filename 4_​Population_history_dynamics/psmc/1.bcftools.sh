while read -r sample col2 col3; do
    cat > "${sample}.sh" <<EOF
#!/bin/bash
echo "Processing sample ${sample}..."

bcftools mpileup -C50 -f /home/xichen/chenxi/Csq_v2.0.fasta \
    "/home/xichen/chenxi/onnare_8/03.bam/${sample}.addhead.rmdup.bam" | \
bcftools call -c -V indels | \
vcfutils.pl vcf2fq -d "${col2}" -D "${col3}" | \
gzip > "${sample}.fq.gz"

echo "Finished processing sample ${sample}."
EOF

    chmod +x "${sample}.sh"

echo    "nohup sh "${sample}.sh" > "${sample}.log" 2>&1 & "
done < sample.depth.list

wait
echo "All samples processed!"

