seqkit  sliding  -s 200000 -W 200000 -S _DQ1 DQ1.genome.fa.gz | seqkit seq -w 0  > DQ1.genome.fa

awk BEGIN{RS=EOF}'{gsub(/\n/,"\t");print}' DQ1.genome.fa > new.DQ1.genome.fa

