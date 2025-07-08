plink2 --bfile snpEff.bctools.gatk.maf005.mis095 \
	--allow-extra-chr \
	--double-id \
	--indep-pairwise 50 5 0.2 \
	--out Csq.ld_50.5.02
