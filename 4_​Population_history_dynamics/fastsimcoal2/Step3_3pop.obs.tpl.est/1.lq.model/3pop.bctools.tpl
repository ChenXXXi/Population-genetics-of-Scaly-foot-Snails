//Parameters for the coalescence simulation program : fastsimcoal.exe
3 samples to simulate :
//Population effective sizes (number of genes)
Nsou$
Nmid$
Nnor$
//Haploid samples sizes 
48 0 0.14
148 0 0.06
50 0 0.11
//Growth rates: negative growth implies population expansion
0
0
0
//Number of migration matrices : 0 implies no migration between demes
3
//Migration matrix 0
0 mig_mid2sou$ 0
mig_sou2mid$ 0 mig_nor2mid$
0 mig_mid2nor$ 0
//Migration matrix 1
0 mig_mid2sou$ 0
mig_sou2mid$ 0 0
0 0 0
//Migration matrix 2
0 0 0
0 0 0
0 0 0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
4 historical event
150000 2 2 0 intensity_bot_nor$ 0 0 instbot
150000 2 1 1 1 0 1
250000 1 1 0 intensity_bot_mid$ 0 1 instbot
250000 1 0 1 1 0 2
//Number of independent loci [chromosome] 
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per generation recombination and mutation rates and optional parameters
FREQ 1 0 1e-8 OUTEXP
