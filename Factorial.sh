#!/bin/bash
#Rijoanul Hasan

read -p 'Enter number' n

fact=1

while (( n > 0 ))
do
    (( fact = fact * n ))
    (( n-- ))
done

echo "Result is: $fact"
