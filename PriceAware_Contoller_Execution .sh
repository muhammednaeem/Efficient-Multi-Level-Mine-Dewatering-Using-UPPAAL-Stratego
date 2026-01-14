
#!/bin/bash

N=10
export L='1' #days
export I='24' #reuse
export IT='1' #iterations
export WEATHER=1 #0 for exact weather and 1 for fake weather

#running feb week 4-10
export MONTH='2'
export DAY='4'
export OFF='0'
E=1 #0 for Th,Te from EM; 1 for Th,Te from LM


export C=0
for R in 50; do
export  RUNS="$R" 

for i in $(seq 0 10 ) ; do
        export A=$(echo "$i/10" | bc -l)
        export G=$(echo "1-$A" | bc -l)
        export LOAD_ESTIMATED_TH_TE="$E"
        for i in $(seq 1 $N); do ./run_EM_local.sh ; done


done
done
#exit
export C=1
for R in 1 ; do
export  RUNS="$R"
for i in $(seq 0 10 ) ; do
        export A=$(echo "$i/10" | bc -l)
        export G=$(echo "1-$A" | bc -l)
        export LOAD_ESTIMATED_TH_TE="$E"
        for i in $(seq 1 $N); do ./run_EM_local.sh ; done

done
done



