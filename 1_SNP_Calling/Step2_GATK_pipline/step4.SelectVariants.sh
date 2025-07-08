gatk SelectVariants \
	-select-type SNP \
	-V ./step5.output/125.Csq.all.vcf.gz \
	-O ./Csq.snp.vcf.gz
