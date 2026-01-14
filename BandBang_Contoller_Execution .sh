#!/bin/bash 

# when using sbatch, you need to set your server details

export WHICH_LM="LM$WEATHER"
cp $WHICH_LM/LM.xml models/

YEAR='2018'
WEEK_BACK_DATE=$(date -d "$MONTH/$DAY/$YEAR-7 days")
WEEK_BACK_MONTH=$(date -d "$WEEK_BACK_DATE" '+%m')
WEEK_BACK_DAY=$(date -d "$WEEK_BACK_DATE" '+%d')

echo "calculating normalization factor"

export START_DATA="$WEEK_BACK_MONTH $WEEK_BACK_DAY $OFF $L $I 1"
export WEIGHT_VALUES="1.0 1.0 1.0"
export SET_RUNS="1 $IT"
RAND=$(od -A n -t dL -N 4 /dev/urandom |tr -d ' ')
echo "rand is $RAND"
export STRATEGY_DIR=$(pwd)/normalization_factor/$WEEK_BACK_MONTH$WEEK_BACK_DAY/$RAND
echo "Normalization path is $STRATEGY_DIR"
mkdir -p $STRATEGY_DIR
echo "Running with normalization directory $STRATEGY_DIR"
RES=$(./uppaal/bin/verifyta -s -D 0.1 ./models/EM.xml 2>&1 )
echo "$RES" > $STRATEGY_DIR/Result.txt
comfort=$(sed '1q;d' $STRATEGY_DIR/cost_and_discomfort_values.txt)
cost=$(sed '2q;d' $STRATEGY_DIR/cost_and_discomfort_values.txt)
echo "$comfort is comfort"
echo "$cost is cost"
Norm=$(bc <<< "scale=4; $comfort / $cost")
echo "$Norm is the normalization factor "

echo "using normalization factor in full setup"

export START_DATA="$MONTH $DAY $OFF $L $I $C"
echo "$START_DATA is start data"
export WEIGHT_VALUES="$A $G $Norm"
echo "$WEIGHT_VALUES is weight_values"
export SET_RUNS="$RUNS $IT"
echo "$SET_RUNS is set runs"

GH=$(git rev-parse --short HEAD)
START=$(eval "printf \"M%dD%dH%dP%dI%dC%d\" $START_DATA")
WEIGHT=$(eval "printf \"A%0.2fG%fN%0.2f\" $WEIGHT_VALUES")
OPTS=$(eval "printf \"R%dI%d\" $SET_RUNS")
export STRATEGY_DIR=$(pwd)/results/$GH/$START/$WEIGHT/$OPTS/$RAND
echo "Running with strategy directory $STRATEGY_DIR"
mkdir -p $STRATEGY_DIR
cp ./intial_th_ti_for_LM/* $STRATEGY_DIR
RAND2=$(od -A n -t dL -N 4 /dev/urandom|tr -d ' ')
export LM_SEED=$(od -A n -t dL -N 4 /dev/urandom |tr -d ' ')
RES=$(./uppaal/bin/verifyta --seed $RAND2 -s -D 0.1 ./models/EM.xml 2>&1 )
echo "$RES" > $STRATEGY_DIR/Result.txt
echo "Done"
