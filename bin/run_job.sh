#!/bin/bash

WORKFLOW_DESTINATION=$1
script_dir=$(pwd)/$(dirname $0)
workflow_dir=${script_dir}/../workflow
resources_dir=${script_dir}/../resources

echo "replacing workflow dir in hdfs..."
if hdfs dfs -test -d workflow; then
  hdfs dfs -rmr workflow
fi

hdfs dfs -put ${workflow_dir} ${WORKFLOW_DESTINATION}

echo "submitting oozie job..."
oozie job -config  ${resources_dir}/oozie.properties -run