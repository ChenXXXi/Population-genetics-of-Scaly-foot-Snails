## Step1 fastp

fastp 
-i F1-3-1231102_1.fq.gz -I F1-3-1231102_2.fq.gz \
-o 1_1.fq.gz -O 1_2.fq.gz \
--length_required 60 --detect_adapter_for_pe \
--qualified_quality_phred 20  --unqualified_percent_limit 20  \
--n_base_limit 5 --thread 8

