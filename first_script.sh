#!/bin/bash
var=/home/aman/bash_script/first_script.sh

if [ -e $var ]
then
	echo "File Exists"
else
	echo "file doesn't exists"
fi
