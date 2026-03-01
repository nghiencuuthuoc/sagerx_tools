#!/bin/bash

# List of DAGs to run sequentially every 30 minutes
DAGS=(
  ashp
  build_marts
  cms_part_d
  dailymed
  dailymed_pharm_class
  dailymed_rxnorm
  dailymed_zip_file_metadata
  dbt_gcp
  export_marts
  fda_enforcement
  fda_excluded
  fda_ndc
  fda_unfinished
  fda_unii
  mccpd
  nadac
  orange_book
  purple_book
  rxclass
  rxnorm
  rxnorm_historical
  rxterms
  umls
  vsac
)

# Log file
LOGFILE="dag_run_log.txt"

echo "=== Airflow DAG Auto Runner Started at $(date) ===" >> "$LOGFILE"

for DAG_ID in "${DAGS[@]}"; do
  echo "[$(date)] 🔓 Unpausing $DAG_ID" >> "$LOGFILE"
  docker exec -i airflow-webserver airflow dags unpause "$DAG_ID" >> "$LOGFILE" 2>&1

  echo "[$(date)] 🚀 Triggering $DAG_ID" >> "$LOGFILE"
  RUN_OUTPUT=$(docker exec -i airflow-webserver airflow dags trigger "$DAG_ID" 2>&1)
  echo "$RUN_OUTPUT" >> "$LOGFILE"

  echo "[$(date)] 💤 Sleeping 30 minutes before next DAG..." >> "$LOGFILE"
  sleep 1800
done

echo "=== Finished All DAGs at $(date) ===" >> "$LOGFILE"
