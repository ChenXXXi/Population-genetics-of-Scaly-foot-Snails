plink --bfile snpEff.bctools.gatk.maf005.mis095 \
        --allow-extra-chr \
        --exclude Csq.ld_50.10.02.prune.out \
        --recode 12 \
        --out snpEff.bctools.gatk.maf005.mis095.pruned \
        --keep-allele-order \
        --set-missing-var-ids @:#

