#!/bin/bash
## DATE :: 05-04-2017

## A SIMPLE HADOOP WORDCOUNT JOB 

if [ $# -eq 4 ]; then       
    JAR=$1
    CLASS=$2
    INPUT=$3
    OUTPUT=$4
    hdfs dfs -test -d ${OUTPUT};
    if [ $? -eq 0 ]; then
	echo "The given Directory $OUTPUT  already exists in the HDFS.."
	echo "Please give another directory..!"
	exit 0
    else
	hadoop jar $JAR $CLASS $INPUT $OUTPUT
	if [ $? -eq 0 ]; then
	    echo "Job Completed Successfully and ouput stored in HDFS in the path $OUTPUT"
            echo "Hadoop Namenode URL :: http://110.110.112.117:50070 "
	else
	    echo "Job is not completed successfully.. Please check the error for details..!"
	    exit 0
	fi
    fi 
else 
    echo "Arguments should be 4"
    echo "Usage of Script::"
    echo "./wordcount.sh <jar path> <class-name> <hdfs input-path> <hdfs output-path>"
    exit 0
fi

