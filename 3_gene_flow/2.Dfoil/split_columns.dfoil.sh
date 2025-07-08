#!/bin/bash

mkdir -p "$1"
cd "$1" || exit 1
ln -sf ../"$1.fasta" .

input_file="$1.fasta"
num_cols=$(awk '{print NF; exit}' "$input_file")

# Clear old output files
rm -f output_* 2>/dev/null

awk -v num_cols="$num_cols" '
{
    for (i=1; i<=num_cols; i+=2) {
        j = i + 1
        if (j <= num_cols) {
            print $i "\t" $j >> ("output_"i"_"j".txt")
        }
    }
}' "$input_file"

for i in output*; do
    paste ../p.txt "$i" | awk '{print $1"\t"$3}' | sed 's/\t/\n/' > "p.$i"
done


#DFOIL
python3 ~/biosoftware/dfoil-master/new.fasta2dfoil.py p.* -o "$1.fa.counts" --names P1,P2,P3,P4,PO


python3 ~/biosoftware/dfoil-master/dfoil.py --infile "$1.fa.counts" --out "../$1.fa.out" --plot "../$1.pdf"
