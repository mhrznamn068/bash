#!/bin/bash
no_of_args=2

e_noargs=65
e_badargs=85
e_unreadable=86
e_nofile=87
e_size=89

if [[ -z "$1" && -z "$2" ]]
then
	echo "No arguments given"
	exit $e_noargs
fi
if [ $# -ne "$no_of_args" ]
then
	echo "Usage:`basename $0` file1 file2"
exit $e_badargs
fi
if [[ ! -e "$1" || ! -e "$2" ]]
then
	echo "Files do not exist"
	exit $e_nofile
elif [[ ! -f "$1" || ! -f "$2" ]]
then
	echo "Files need to be regular files"
	exit $e_nofile
elif [[ ! -r "$1" || ! -r "$2" ]]
then
	echo "No read permission"
	exit $e_unreadable
elif [[ ! -s "$1" || ! -s "$2" ]]
then
	echo "Files are zero-siz"
	exit $e_size
fi

cat $1 $2 | sort > file.txt

if [ $? -eq 0 ]
then
	echo "Execution of script was successful"
	cat file.txt
else
	echo "Execution of script failed"
fi
