#!/bin/bash

set -x #echo on

hdfs_workflow_dir=$1
script_dir=$(pwd)/$(dirname $0)
workflow_dir=$script_dir/../workflow
resources_dir=$script_dir/../resources

echo "replacing workflow dir in hdfs..."
hdfs dfs -rmr ${hdfs_workflow_dir}
hdfs dfs -put ${workflow_dir} ${hdfs_workflow_dir}
