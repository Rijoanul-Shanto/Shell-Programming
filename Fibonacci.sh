#!/bin/bash
#Rijoanul Hasan

read -p 'Enter number' n

first=-1
second=1

for (( i = 1; i <= n; i++ ))
do
    (( fib = first + second ))
    (( first = second ))
    (( second = fib ))
done

echo "$n th Fibonacci is: $fib"
