#!/bin/bash

# Genome file and BAM list file
GENOME="Csq_v2.0.fasta"
BAM_LIST="all.addhead.rmdup.bam.list"
OUTPUT_DIR="3rd.bcftools.bcf.output"
THREADS=16

# Create the output directory
mkdir -p $OUTPUT_DIR

# Get all chromosome names starting with chr
chromosomes=$(cat chr.list)

# Loop through each chromosome and generate a separate script
for chr in $chromosomes
do
    script_name="3rd.call_snps_${chr}.sh"
    echo "#!/bin/bash" > $script_name
    echo "GENOME=\"$GENOME\"" >> $script_name
    echo "BAM_LIST=\"$BAM_LIST\"" >> $script_name
    echo "OUTPUT_DIR=\"$OUTPUT_DIR\"" >> $script_name
    echo "THREADS=$THREADS" >> $script_name
    echo "" >> $script_name
    echo "echo \"Processing chromosome: $chr\"" >> $script_name
    echo "" >> $script_name
    echo "bcftools mpileup --annotate FORMAT/AD,FORMAT/DP,FORMAT/SP,FORMAT/QS --threads \$THREADS -Ou -f \$GENOME -r $chr --bam-list \$BAM_LIST | \\" >> $script_name
    echo "bcftools call --annotate GQ,GP --group-samples group_samples --threads \$THREADS -mv -Ob -o \$OUTPUT_DIR/Csq.calls.$chr.bcf" >> $script_name
    echo "" >> $script_name
    echo "echo \"SNP calling for chromosome $chr is complete.\"" >> $script_name
    
    # Grant execute permission for the script
    chmod +x $script_name
done

echo "Scripts for all chromosomes have been generated."
