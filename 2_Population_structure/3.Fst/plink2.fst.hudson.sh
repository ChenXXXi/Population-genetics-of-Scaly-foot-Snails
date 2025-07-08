plink2 --vcf T20.bcftools.gatk.maf005.miss095.Csq.diploid.filtered.vcf.gz --double-id --allow-extra-chr --set-missing-var-ids @:#  --make-bed --out Csq.all.snp

plink2  --bfile Csq.all.snp --within group.tsv --fst CATPHENO method=hudson blocksize=1000000 --allow-extra-chr --out Csq.all.HudsonFst.global &
