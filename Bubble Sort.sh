#!/bin/bash
#Rijoanul Hasan
#Bubble Sort

read -p 'Enter number of element' n

for (( i = 1; i <= n; i++ ))
do
    echo "Enter element $i"
    read arr[$i]
done

echo "Elements before sort:"

for (( i = 1; i <= n; i++ ))
do
    echo "Element $i: ${arr[$i]}"
done

echo

for (( i = 1; i < n; i++ ))
do
    for (( j = 1; j <= n-i; j++ ))
    do
        if (( arr[j] > arr[j+1] ))
        then
            temp=${arr[$j]}
            arr[$j]=${arr[$j+1]}
            arr[$j+1]=$temp
        fi
    done
done

echo "Elements after sort:"

for (( i = 1; i <= n; i++ ))
do
    echo "Element $i: ${arr[$i]}"
done
