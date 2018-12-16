#!/bin/bash
max=10
i=1
while [ "$i" -le $max ]
do
	n=$RANDOM
	echo $n
	let "i += 1"
done

