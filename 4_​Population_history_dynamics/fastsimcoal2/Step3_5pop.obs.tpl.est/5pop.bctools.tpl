//Parameters for the coalescence simulation program : fastsimcoal.exe
10 samples to simulate :
//Population effective sizes (number of genes)
Nlq$
Ntc$
Nkrso$
Non$
Nwc$
Ngost5$
Ngost6$
Ngost7$
Ngost8$
Ngost9$
//Haploid samples sizes 
48 0 0.3
40 0 0.05
108 0 0
32 0 0.15
18 0 0.3
0 TDiv_on$ 0
0 TDiv_wc$ 0
0 TDiv_wc$ 0
0 TDiv_G1$ 0
0 TDiv_G0$ 0
//Growth rates: negative growth implies population expansion
0
0
0
0
0
0
0
0
0
0
//Number of migration matrices : 0 implies no migration between demes
5
//Migration matrix 0
0 mtc_lq$ 0 0 0 0 0 m7_lq$ m8_lq$ 0
mlq_tc$ 0 mkrso_tc$ 0 0 0 0 0 0 0
0 mtc_krso$ 0 mon_krso$ 0 m5_krso$ 0 0 0 0
0 0 mkrso_on$ 0 mwc_on$ 0 0 0 0 0
0 0 0 mon_wc$ 0 m5_wc$ 0 0 0 0
0 0 mkrso_5$ 0 mwc_5$ 0 0 0 0 0
0 0 0 0 0 0 0 m7_6$ 0 0
mlq_7$ 0 0 0 0 0 m6_7$ 0 0 0
mlq_8$ 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
//Migration matrix 1
0 mtc_lq$ 0 0 0 0 0 m7_lq$ m8_lq$ 0
mlq_tc$ 0 mkrso_tc$ 0 0 0 0 0 0 0
0 mtc_krso$ 0 0 0 m5_krso$ 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 m5_wc$ 0 0 0 0
0 0 mkrso_5$ 0 mwc_5$ 0 0 0 0 0
0 0 0 0 0 0 0 m7_6$ 0 0
mlq_7$ 0 0 0 0 0 m6_7$ 0 0 0
mlq_8$ 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
//Migration matrix 2
0 0 0 0 0 0 0 m7_lq$ m8_lq$ 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 m7_6$ 0 0
mlq_7$ 0 0 0 0 0 m6_7$ 0 0 0
mlq_8$ 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
//Migration matrix 3
0 0 0 0 0 0 0 0 m8_lq$ 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
mlq_8$ 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
//Migration matrix 4
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
18 historical event
TDiv_on$ 3 3 0 intensity_bot_on$ 0 0 instbot
TDiv_on$ 3 5 1 1 0 1
TDiv_wc$ 4 4 0 intensity_bot_wc$ 0 1 instbot
TDiv_wc$ 5 5 0 intensity_bot_G3$ 0 1 instbot
TDiv_wc$ 1 1 0 intensity_bot_tc$ 0 1 instbot
TDiv_wc$ 2 2 0 intensity_bot_kr$ 0 1 instbot
TDiv_wc$ 4 6 1 1 0 2
TDiv_wc$ 5 6 1 1 0 2
TDiv_wc$ 1 7 1 1 0 2
TDiv_wc$ 2 7 1 1 0 2
TDiv_G1$ 7 7 0 intensity_bot_G1$ 0 2 instbot
TDiv_G1$ 6 6 0 intensity_bot_G2$ 0 2 instbot
TDiv_G1$ 7 8 1 1 0 3
TDiv_G1$ 6 8 1 1 0 3
TDiv_G0$ 8 8 0 intensity_bot_G0$ 0 3 instbot
TDiv_G0$ 0 0 0 intensity_bot_lq$ 0 3 instbot
TDiv_G0$ 8 9 1 1 0 4
TDiv_G0$ 0 9 1 1 0 4
//Number of independent loci [chromosome] 
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per generation recombination and mutation rates and optional parameters
FREQ 1 0 mutation_rates$ OUTEXP
