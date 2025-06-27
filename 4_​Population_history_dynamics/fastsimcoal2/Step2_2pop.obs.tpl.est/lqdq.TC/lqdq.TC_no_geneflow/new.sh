PREFIX="no_geneflow"

for i in {1..10}
do
	mkdir run$i
	cp ${PREFIX}.tpl ${PREFIX}.est ${PREFIX}_jointMAFpop1_0.obs run$i
	cd run$i
	fsc28 -t ${PREFIX}.tpl -e ${PREFIX}.est -m -0 -C 10 -n 200000 -L 40 -s 0 -M -c 0 -q
	cd ..
done
