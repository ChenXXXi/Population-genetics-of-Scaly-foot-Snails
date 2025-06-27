# -*- coding: utf-8 -*-
# This script simulates genomic samples, and the corresponding AFS, LD and IBS summary statistics, as described in the manuscript.
# 调用脚本时需传入运行ID参数（如 python script.py 1）
# 结果文件将根据运行ID自动命名以避免覆盖

import sys
import time
import datetime
import numpy as np
import popgen_abc
import tarfile
import os

start_time = time.time()

################################################
############### parameters #####################
################################################

# 从命令行获取运行ID（默认值'0'）
run_id = sys.argv[1] if len(sys.argv) > 1 else '0'

# 通用参数
outfile_name = 'tc_{}'.format(run_id)  # 使用旧版字符串格式化
nb_rep = 1000
nb_seg = 100
L = 2000000
n = 40
mac = 4
mac_ld = 4
save_msp = False

# 时间窗口参数
nb_times = 21
Tmax = 10000
a = 0.06
times = -np.ones(shape=nb_times, dtype='float')
for i in range(nb_times):
    times[i] = (np.exp(np.log(1 + a * Tmax) * i / (nb_times - 1)) - 1) / a
print("Population size changes at the following times (generations):")
print(times)
print("")

# 先验分布参数
r_min = 1e-8
r_max = 10e-8
mu_min = 1e-8
mu_max = 4e-8
Nmin = 1
Nmax = 4.5

# LD统计量参数
per_err = 5
r = 1e-8
interval_list = []
for i in range(nb_times - 1):
    t = (times[i + 1] + times[i]) / 2
    d = 1 / (2 * r * t)
    if d <= L:
        interval_list.append([d - per_err * d / 100, d + per_err * d / 100])
t = Tmax + times[nb_times - 1] - times[nb_times - 2]
d = 1e8 / (2 * t)
interval_list.append([d - per_err * d / 100, d + per_err * d / 100])
print("LD distance bins (bp):")
print(interval_list)
print("")

# IBS统计量参数
prob_list = [0.0001, 0.001, 0.01, 0.1, 0.25, 0.5, 0.75, 0.9, 0.99, 0.999, 0.9999]
size_list = [1]

################################################
############### main program ###################
################################################

# 初始化结果矩阵
nb_dist = len(interval_list)
nb_prob = len(prob_list)
nb_size = len(size_list)
params = -np.ones(shape=[nb_rep, nb_times + 2], dtype='float')
results = -np.ones(shape=[nb_rep, nb_dist + nb_size * nb_prob + n // 2 + 1], dtype='float')
print('Total number of statistics: {}\n'.format(nb_dist + nb_size * nb_prob + n // 2 + 1))

# 从先验分布中采样参数
params[:, 0] = np.random.uniform(low=mu_min, high=mu_max, size=nb_rep)  # 突变率
params[:, 1] = np.random.uniform(low=r_min, high=r_max, size=nb_rep)    # 重组率

# 生成人口规模轨迹
for i in range(nb_times):
    if i == 0:
        pop_size = 10**(np.random.uniform(low=Nmin, high=Nmax, size=nb_rep))
    else:
        mult_factor = 10**np.random.uniform(-1, 1, size=nb_rep)
        pop_size = params[:, 1 + i] * mult_factor
        pop_size = np.clip(pop_size, 10**Nmin, 10**Nmax)
    params[:, 2 + i] = pop_size

# 模拟数据
outfile_name_2 = '{}_n{}_s{}'.format(outfile_name, n, nb_seg)  # 替换f-string
print('Starting simulations...')
for i in range(nb_rep):
    elapsed_time = time.time() - start_time
    print('Simulating replicate {}, Time: {}, Elapsed: {}'.format(
        i + 1, time.ctime(), datetime.timedelta(seconds=elapsed_time)))
    sys.stdout.flush()
    try:
        results[i, :] = popgen_abc.simul_stats_one_rep_macld(
            outfile_name_2, i, nb_seg, L, n, times, params[i, :],
            interval_list, size_list, prob_list, L, mac=mac, mac_ld=mac_ld, save_msp=save_msp
        )
    except Exception as e:
        print('Error in replicate {}: {}'.format(i + 1, str(e)))
        pass

# 保存结果
np.savetxt(
    '{}_mac{}_macld{}.stat'.format(outfile_name_2, mac, mac_ld),
    results[0:nb_rep, :],
    fmt='%.3e'
)
np.savetxt(
    '{}.params'.format(outfile_name_2),
    params[0:nb_rep, :],
    fmt='%.3e'
)
print("Results saved")

# 处理ms输出文件（如果启用）
if save_msp:
    with tarfile.open('{}.ms.tar.bz2'.format(outfile_name_2), 'w:bz2') as mytar:
        for i in range(nb_rep):
            for j in range(nb_seg):
                fname = '{}_rep{}_seg{}.msp'.format(outfile_name_2, i + 1, j + 1)
                if os.path.exists(fname):
                    mytar.add(fname)
                    os.remove(fname)
    print("Archived ms files")

# 结束状态
elapsed_time = time.time() - start_time
print('Job completed at {}, Total duration: {}'.format(
    time.ctime(), datetime.timedelta(seconds=elapsed_time)))
