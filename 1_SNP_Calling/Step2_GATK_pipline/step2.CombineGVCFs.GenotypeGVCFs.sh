#!/bin/bash

outdir="/home/xichen/chenxi/onnare_8/04.gatk/step4_2.output"
mkdir -p "$outdir"

while IFS= read -r i; do
  cat << EOF > "${i}.gatk.sh"
#!/bin/bash

reference="/home/xichen/chenxi/gatk.vcf.output/Csq.genome"
indir="/home/xichen/chenxi/onnare_8/04.gatk/step4.output"
outdir="/home/xichen/chenxi/onnare_8/04.gatk/step4_2.output"

# Check input file
file1="\$indir/Csq.${i}.g.vcf.gz"

# Define parameter group
sample_gvcfs=(-V "\$file1")

# Combine GVCFs
gatk CombineGVCFs \\
  -R "\$reference/Csq_v2.0.fasta" \\
  "\${sample_gvcfs[@]}" \\
  -O "\$outdir/125.Csq.${i}.g.vcf.gz"

# Genotype
gatk GenotypeGVCFs \\
  -R "\$reference/Csq_v2.0.fasta" \\
  -V "\$outdir/125.Csq.${i}.g.vcf.gz" \\
  -O "\$outdir/125.Csq.${i}.vcf.gz"
EOF

  chmod +x "${i}.gatk.sh"
done < chr.list
