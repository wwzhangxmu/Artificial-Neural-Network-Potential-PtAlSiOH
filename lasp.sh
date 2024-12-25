#!/bin/bash
#SBATCH -J train
#SBATCH -N 7
#SBATCH --ntasks-per-node=64
#SBATCH --exclusive
#SBATCH --mem=0
#SBATCH -p wzhcnormal
#SBATCH -o o.out
#SBATCH -e e.out

module purge
module load compiler/intel/2017.5.239
module load mpi/intelmpi/2017.4.239

export PATH=/work/home/xxx/yyy/FULL_pro3.4.5_intel18_gamma/Src:$PATH

echo -n "start time  " > time
date >> time
mpirun -n 448 lasp -i lasp.in > output
echo -n "end   time  " >> time ; date >> time
