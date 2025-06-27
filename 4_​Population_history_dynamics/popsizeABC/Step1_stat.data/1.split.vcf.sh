list="chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15"
for i in ${list}
do
	nohup bcftools view -r "${i}" T20.bcftools.gatk.mac5.miss1.Csq.diploid.filtered.vcf.gz -o "cattle_data/${i}.vcf.gz" -Oz > "cattle_data/${i}.log" 2>&1 &
done
