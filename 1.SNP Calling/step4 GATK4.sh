## GATK4 step.4.sh
gatk=~/App/miniconda3/condabin/gatk
reference=/home/dongjiyao/Data/Pomacea_canaliculata/01.ref/
indir=~/Data/ydj_cx/family_mutation_rate/3.step
outdir=$indir

for i in $(cat chr.list)
do
    sample_gvcfs=""
    for sample in $(cat sample.list)
    do
        sample_gvcfs=${sample_gvcfs}"-V $outdir/${sample}/${sample}.${i}.g.vcf.gz "
    done

    gatk CombineGVCFs \
        -R $reference/genome.fasta \
        ${sample_gvcfs} \
        -O $outdir/poplation/Pma.${i}.g.vcf.gz

    gatk GenotypeGVCFs \
        -R $reference/genome.fasta \
        -V $outdir/poplation/Pma.${i}.g.vcf.gz \
        -O $outdir/poplation/Pma.${i}.vcf.gz

done
