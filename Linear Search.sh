#!/bin/bash
#Rijoanul Hasan
#Linear Search

read -p 'Enter number of element' n

for (( i = 1; i <= n; i++ ))
do
    echo "Enter element $i"
    read arr[$i]
done

read -p 'Enter element to search' ele

for (( i = 1; i <= n; i++ ))
do
    if (( arr[i] == ele ))
    then
        echo "Element found at $i position!"
        break
    fi
    if (( i == n))
    then
        echo "Element not found!"
        break
    fi
done
