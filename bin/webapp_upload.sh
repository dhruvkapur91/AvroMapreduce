#!/bin/bash

script_dir=$(pwd)/$(dirname $0)
workflow_dir=$script_dir/../workflow
resources_dir=$script_dir/../resources

echo "upload to webapp..."
java -classpath "$workflow_dir/lib/*"  com.cat.olga.utils.LoadWorkflowProperties  $resources_dir
