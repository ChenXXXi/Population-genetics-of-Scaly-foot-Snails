for x in {1..100}
do
    VCF2Dis -InPut T20.bcftools.gatk.maf005.miss095.Csq.diploid.filtered.min4.phy -OutPut p_dis_${x}.mat -Rand 0.5  -InFormat PHY -TreeMethod 1
    
    fneighbor -datafile p_dis_${x}.mat -outfile tree.out1_${x}.txt -matrixtype s -treetype n -outtreefile tree.out2_${x}.tre

done

cat   tree.out2_*.tre   >  ALLtree_merge.tre

fconsense   -intreefile   ALLtree_merge.tre  -outfile nj_100  -treeprint Y
