plink2 -vcf T20.bcftools.gatk.maf005.miss095.Csq.diploid.filtered.vcf.gz \
  --allow-extra-chr \
  --set-missing-var-ids @:# \
  --double-id \
  --make-bed \
  --out snpEff.bctools.gatk.maf005.mis095

