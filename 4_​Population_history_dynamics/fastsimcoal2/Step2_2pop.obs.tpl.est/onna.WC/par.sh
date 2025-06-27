PREFIX="$1"
##cd ~/fastsimcoal/$PREFIX/bestrun

# create temporary obs file with name _maxL_MSFS.obs
cp ${PREFIX}_jointMAFpop1_0.obs ${PREFIX}_maxL_jointMAFpop1_0.obs

# Run fastsimcoal 20 times (in reality better 100 times) to get the likelihood of the observed SFS under the best parameter values with 1 mio simulated SFS.
for i in {1..20}
do
 fsc28 -i ${PREFIX}_maxL.par -n1000000 -m -q -0
 # Fastsimcoal will generate a new folder called ${model}_maxL and write files in there

 # collect the lhood values (Note that >> appends to the file, whereas > would overwrite it)
 sed -n '2,3p' ${PREFIX}_maxL/${PREFIX}_maxL.lhoods  >> ${PREFIX}.lhoods

 # delete the folder with results
 rm -r ${PREFIX}_maxL/
done
