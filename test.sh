#!/bin/bash
echo "Enter number of process"
read n

echo "Enter process , AT , BT , Priority"
for (( i = 1; i <= n; i++ ))
do
	read p[$i]
	read at[$i]
	read bt[$i]
	read pr[$i]
done

for(( i = 1; i <= n-1 ; i++))
do
	for(( j = 1; j <= n-i; j++))
	do
	    if [ ${at[$j]} -gt ${at[$j+1]} ]
	    then
        	temp=${at[$j]}
        	at[$j]=${at[$j+1]}
        	at[$j+1]=$temp
    	
        	temp=${bt[$j]}
            bt[$j]=${bt[$j+1]}
            bt[$j+1]=$temp
        
        	temp=${pr[$j]}
            pr[$j]=${pr[$j+1]}
            pr[$j+1]=$temp
        	
        
        	temp=${p[$j]}
            p[$j]=${p[$j+1]}
            p[$j+1]=$temp
	    fi
	done
done

ct=`expr ${at[1]} + ${bt[1]} `
tat=`expr $ct - ${at[1]} `
wt[1]=`expr $tat - ${bt[1]} `

for(( i=2; i<=n-1; i++ ))
do
    for(( j=2; j<=n-1; j++ ))
    do
        if [ ${pr[$j]} -gt ${pr[$j+1]} ]
        then
            
            temp=${at[$j]}
            at[$j]=${at[$j+1]}
            at[$j+1]=$temp
    
            temp=${bt[$j]}
            bt[$j]=${bt[$j+1]}
            bt[$j+1]=$temp
    
            temp=${p[$j]}
            p[$j]=${p[$j+1]}
            p[$j+1]=$temp
    
    	    temp=${pr[$j]}
            pr[$j]=${pr[$j+1]}
            pr[$j+1]=$temp
        fi
    done
done

for(( i=2; i<=n; i++ ))
do
	ct=`expr $ct + ${bt[$i]} `
	tat=`expr $ct - ${at[$i]} `
	wt[i]=`expr $tat - ${bt[$i]} `
done

twt=0

for(( i=1; i<=n; i++))
do
    twt=`expr $twt + ${wt[i]} `
done

echo $twt

awt=`expr $twt / $n `

echo "Average waiting time $awt"
