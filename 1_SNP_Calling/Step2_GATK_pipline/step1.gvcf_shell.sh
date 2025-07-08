ref=/home/xichen/chenxi/gatk.vcf.output/Csq.genome/Csq_v2.0.fasta

mkdir -p  ./tmp

cat sample_bam.list |while read  sample  bam
do
        mkdir $sample
        cat chr.list |while read chr
        do
                echo "nohup gatk --java-options \"-XX:ParallelGCThreads=8 -Xmx150g -Djava.io.tmpdir=./tmp\" HaplotypeCaller -R $ref  -I $bam -L $chr  -ERC GVCF  --tmp-dir ./tmp -O $sample/$sample.$chr.g.vcf.gz 1>$sample/$sample.$chr.HC.log 2>&1 &"

        done >  step1.$sample.HaplotypeCaller.sh
done

