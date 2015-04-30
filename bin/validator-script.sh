#!/bin/sh
set -e

script_dir=$(pwd)/$(dirname $0)

workflow_dir=$script_dir/../workflow

echo "Main"
oozie validate $workflow_dir/workflow.xml

echo "Cat Import"
oozie validate $workflow_dir/cat-import/import-cat-configs-wf.xml

echo "Cat Engine Import"
oozie validate $workflow_dir/cat-import/engine/import-engine-data-wf.xml

echo "CSV Generation"
oozie validate $workflow_dir/csv-generation/opportunity-search.xml

echo "Import DDSW Data"
oozie validate $workflow_dir/ddsw-import/import-ddsw-data-wf.xml
oozie validate $workflow_dir/ddsw-import/customer-equipment/import-oracle-customer-ddsw.xml
oozie validate $workflow_dir/ddsw-import/customer-equipment/hadoop/import-hadoop-customer-ddsw.xml

echo "Import DDSW WorkOrder Data"
oozie validate $workflow_dir/ddsw-import/sales/import-work-order.xml
oozie validate $workflow_dir/ddsw-import/sales/hadoop/workorder/import-hadoop-work-order.xml

echo "Import ddsw customer data from hadoop"
oozie validate $workflow_dir/ddsw-import/customer-equipment/hadoop/import-hadoop-customer-ddsw.xml

echo "Import DDSW Invoice Data"
oozie validate $workflow_dir/ddsw-import/sales/import-invoice-data.xml
oozie validate $workflow_dir/ddsw-import/sales/hadoop/invoice/import-hadoop-invoice-data.xml

echo "E2E Opp Generation"
oozie validate $workflow_dir/e2e-opp-generation/e2e-opp-generation.xml
oozie validate $workflow_dir/e2e-opp-generation/opp-generation.xml
oozie validate $workflow_dir/e2e-opp-generation/sales-and-opp-generation.xml
oozie validate $workflow_dir/e2e-opp-generation/sales-generation.xml

echo "E2E Opp Generation"
oozie validate $workflow_dir/generate-equipment-repair-options/generate-equipment-repair-options.xml

echo "Generate Opportunities"
oozie validate $workflow_dir/generate-opportunities/generate-opportunities.xml

echo "Generate repair events"
oozie validate $workflow_dir/generate-repair-events/generate-repair-events.xml

echo "Generate sales events"
oozie validate $workflow_dir/generate-sales-event/generate-sales-event.xml

echo "Import dealer config"
oozie validate $workflow_dir/import-dealer-config/import-dealer-configs-wf.xml

echo "Initial Run"
oozie validate $workflow_dir/initial-run/initial-run-workflow.xml

echo "Populate filter"
oozie validate $workflow_dir/populate-impala/populate-impala.xml

echo "customer equipment exclusion"
oozie validate $workflow_dir/customer-equipment-exclusion/customer-equipment-exclusion.xml

echo "Generate Cognos Data"
oozie validate $workflow_dir/generate-cognos-data/generate_cognos_data.xml

echo "Matching"
oozie validate $workflow_dir/matching/matching.xml

echo "populate opp to impala"
oozie validate $workflow_dir/populate-impala/populate-opportunities/populate-opportunities.xml

echo "populate sales event to impala"
oozie validate $workflow_dir/populate-impala/populate-sales-events/populate-sales-events.xml

echo "generate csv report"
oozie validate $workflow_dir/csv-generation/customer-exclusion-report.xml
oozie validate $workflow_dir/csv-generation/error-report.xml
oozie validate $workflow_dir/csv-generation/opportunity-search.xml
oozie validate $workflow_dir/csv-generation/past-and-future-csv-report.xml

echo "data import and preprocessing"
oozie validate $workflow_dir/data-import-and-preprocessing/data-import-and-preprocessing.xml

echo "data migration"
oozie validate $workflow_dir/data-migration/data-migrator.xml

echo "generate crm opportunities"
oozie validate $workflow_dir/generate-crm-opportunities/generate-crm-opportunities.xml
