#!/bin/bash

traces="cadical-high-60K-1227B.champsimtrace.xz cadical-high-60K-134B.champsimtrace.xz kissat-inc-high-30K-1802B.champsimtrace.xz"

policies="inclusive nine exclusive"

repl_policies="fifo lfu lru rand"

for policy in $policies
do 
    for repl_polc in $repl_policies
    do 
        ./build_champsim.sh bimodal no no no no ${repl_polc} 1 ${policy}
        for trace in $traces
        do 
            echo ${repl_polc}
            echo ${trace}
            echo ${policy}
            time ./run_champsim.sh bimodal-no-no-no-no-${repl_polc}-1core-${policy} 20 30 ${trace} llc
        done
    done
done

