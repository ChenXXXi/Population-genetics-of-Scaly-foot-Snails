## Step3 gvcf_shell

ref=../01.ref/genome.fasta

mkdir  ./tmp

cat sample_bam.list |while read  sample  bam 
do
    mkdir $sample
    cat chr.list |while read chr
    do
        echo "gatk --java-options \"-Xmx15g -Djava.io.tmpdir=./tmp\" HaplotypeCaller -R $ref  -I $bam -L $chr  -ERC GVCF -O $sample/$sample.$chr.g.vcf.gz 1>$sample/$sample.$chr.HC.log   2>&1 "

    done >  step1.$sample.HaplotypeCaller.sh
done
