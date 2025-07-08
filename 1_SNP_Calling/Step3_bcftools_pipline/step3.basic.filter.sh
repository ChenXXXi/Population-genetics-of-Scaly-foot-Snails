#Basic filtering, DP refers to the average value of the total depth accumulated by all samples, qual refers to the quality value, and the minimum value is 60 in the case of high depth.
qual=60
DP=3000

bcftools view \
	--threads 24 \
	-m2 -M2 --types snps \
	-e "QUAL < $qual || (INFO/DP) > 2*$DP ||  (INFO/DP) < 0.5*$DP || F_MISSING > 0.2" \
	-O z -o Csq.diploid.filtered.vcf.gz \
	Csq.bcftools.call.bcf
