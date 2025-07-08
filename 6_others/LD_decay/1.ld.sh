# calc ld with plink
plink2 --vcf T20.bcftools.gatk.mac1.miss1.Csq.diploid.filtered.vcf.gz --double-id --allow-extra-chr \
--set-missing-var-ids @:# \
--maf 0.01 --geno 0.1 --mind 0.5 --chr chr1 \
--thin 0.1 --r2-unphased --ld-window 100 --ld-window-kb 1000 \
--ld-window-r2 0 \
--make-bed --out cichlid_chr1
