#!/bin/bash

echo "Enter number of process"
read n

echo "Enter process, arrival time and burst time"
for (( i = 1; i <= n; i++ ))
do
    read p[$i]
    read at[$i]
    read bt[$i]
done

echo "Enter time quantam value:"
read TQ

for (( i = 1; i < n; i++))
do
    for (( j = 1; j <= n - i; j++ ))
    do
        if (( at[j] > at[j+1] ))
        then
            temp=${at[$j]}
            at[j]=${at[$j+1]}
            at[$j+1]=$temp
            
            temp=${p[$j]}
            p[j]=${p[$j+1]}
            p[$j+1]=$temp
            
            temp=${bt[$j]}
            bt[j]=${bt[$j+1]}
            bt[$j+1]=$temp
        fi
    done
done

for (( i = 1; i <= n; i++ ))
do
    echo "${p[$i]} ${at[$i]} ${bt[$i]}"
    echo
done

point=1
pos=1
Q[1]=1
gantt=0

for (( i = 1; i <= n; i++ ))
do
    mark[$i]=0
done

mark[1]=1


for (( i = 1; ; i++ ))
do
    if (( bt[Q[point]] >= TQ ))
    then
        gantt=`expr $gantt + $TQ`
        bt[${Q[$point]}]=`expr ${bt[${Q[$point]}]} - $TQ`
        
        for (( j = 1; j <= n; j++ ))
        do
            if (( at[p[j]] <= gantt && mark[j] == 0 ))
            then
                pos=`expr $pos + 1`
                Q[$pos]=$j
                mark[${Q[$pos]}]=1
            fi
        done
        
        if (( bt[Q[point]] > 0 ))
        then
            pos=`expr $pos + 1`   
            Q[$pos]=${Q[$point]}
        fi
        point=`expr $point + 1`
    else
        gantt=`expr $gantt + ${bt[${Q[$point]}]}`
        bt[${Q[$point]}]=0
        
        for (( j = 1; j <= n; j++ ))
        do
            if (( at[p[j]] <= gantt && mark[j] != 0 ))
            then
                pos=`expr $pos + 1`
                Q[$pos]=$j
                mark[${Q[$pos]}]=1
            fi
        done
        point=`expr $point + 1`
    fi
    
    flag=0
    
    for (( k = 1; k <= n; k++ ))
    do
        if (( bt[k] != 0 ))
        then
            flag=1
        fi
    done
    
    if (( flag == 0 ))
    then
        break
    fi
    
done

echo "Final Gantt char value: $gantt"
