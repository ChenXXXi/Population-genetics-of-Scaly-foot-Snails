vcftools --gzvcf Csq.snps_filtered.vcf.gz \
	--min-alleles 2 --max-alleles 2 \
	--min-meanDP 10 --max-meanDP 50 \
	--minQ 60 \
	--max-missing 0.8 \
	--remove-filtered-all \
	--recode \
	--stdout | bgzip -c > gatk.Csq.Q60.miss8.maf000.vcf.gz
