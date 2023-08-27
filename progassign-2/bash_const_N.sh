#!/bin/bash

g++-12 -o pthread.out Assgn2Srcpthread-CS21BTECH11043.cpp -lpthread
g++-12 -o openmp.out Assgn2SrcOpenMp-CS21BTECH11043.cpp -fopenmp
python3 sudoko.py 2 5

for j in 2 4 8 16 32 64
do
gawk  -v k=$j  -i inplace   'FNR==1{$1=k}1' input.txt
for i in {1..10} 
    do 
      ./pthread.out
      sleep 1
    done >bash_output_pthread_$j.txt
awk '{sum+=$1} END {print sum/NR}' bash_output_pthread_$j.txt >>bash_output_final_pthread.txt
for i in {1..10} 
    do 
      ./openmp.out
      sleep 1
    done >bash_output_openmp_$j.txt
awk '{sum+=$1} END {print sum/NR}' bash_output_openmp_$j.txt >>bash_output_final_openmp.txt
done
  python3 plot_N_const.py plot_N_const.jpg 
  rm *bash_output*
  echo completed





