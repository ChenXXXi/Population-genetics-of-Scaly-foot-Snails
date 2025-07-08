VCF="bcftools.gatk.maf005.Csq.diploid.filtered.vcf.gz"
# perform linkage pruning - i.e. identify prune sites
plink2 --vcf $VCF --double-id --allow-extra-chr \
--set-missing-var-ids @:# \
--indep-pairwise 10kb 1 0.2 --out Csq.10kb.ld02

# prune and create pca
plink2 --vcf $VCF --double-id --allow-extra-chr --set-missing-var-ids @:# \
--extract Csq.10kb.ld02.prune.in \
--make-bed --pca --out Csq.10kb.ld02
