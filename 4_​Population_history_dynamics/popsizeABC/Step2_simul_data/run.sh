for run_id in {1..10}; do
	nohup python mmu1-4.simul_data_lq.py $run_id > lq.$run_id.log 2>&1 &
	nohup python mmu1-4.simul_data_tc.py $run_id > tc.$run_id.log 2>&1 &
	nohup python mmu1-4.simul_data_krso.py $run_id > krso.$run_id.log 2>&1 &
	nohup python mmu1-4.simul_data_onna.py $run_id > onna.$run_id.log 2>&1 &
	nohup python mmu1-4.simul_data_wc.py $run_id > wc.$run_id.log 2>&1 &

done
