#!/bin/bash

# Create output directory if it doesn't exist
# mkdir -p $output_dir

# Loop through each BAM file starting with "SoK"
for bam_file in SoK*.bam; do
  # Get the file name (without directory and suffix)
  file_name=$(basename "$bam_file" .addhead.rmdup.bam)
  
  # Construct the GATK command
  gatk_cmd="nohup gatk AddOrReplaceReadGroups -I $bam_file -O new.$bam_file -LB $file_name -PL Illumina -PU $file_name -SM $file_name -ID $file_name > ${file_name}.log 2>&1 &"
  
  # Write the command to a new bash script file
  echo $gatk_cmd >> ${file_name}_addheader.sh
  
  # Grant execute permission
  chmod +x ${file_name}_addheader.sh
done
