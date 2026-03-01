#!/bin/bash

LOGFILE="dag_run_ordered_log_v2.txt"
echo "=== DAG Sequential Accurate Runner Started at $(date) ===" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing ashp" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause ashp >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering ashp" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger ashp >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of ashp to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d ashp --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d ashp --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG ashp completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing build_marts" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause build_marts >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering build_marts" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger build_marts >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of build_marts to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d build_marts --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d build_marts --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG build_marts completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing cms_part_d" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause cms_part_d >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering cms_part_d" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger cms_part_d >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of cms_part_d to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d cms_part_d --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d cms_part_d --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG cms_part_d completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dailymed" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dailymed >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering dailymed" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger dailymed >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of dailymed to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG dailymed completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dailymed_pharm_class" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dailymed_pharm_class >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering dailymed_pharm_class" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger dailymed_pharm_class >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of dailymed_pharm_class to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed_pharm_class --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed_pharm_class --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG dailymed_pharm_class completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dailymed_rxnorm" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dailymed_rxnorm >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering dailymed_rxnorm" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger dailymed_rxnorm >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of dailymed_rxnorm to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed_rxnorm --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed_rxnorm --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG dailymed_rxnorm completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dailymed_zip_file_metadata" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dailymed_zip_file_metadata >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering dailymed_zip_file_metadata" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger dailymed_zip_file_metadata >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of dailymed_zip_file_metadata to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed_zip_file_metadata --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed_zip_file_metadata --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG dailymed_zip_file_metadata completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dbt_gcp" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dbt_gcp >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering dbt_gcp" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger dbt_gcp >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of dbt_gcp to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d dbt_gcp --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dbt_gcp --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG dbt_gcp completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing export_marts" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause export_marts >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering export_marts" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger export_marts >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of export_marts to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d export_marts --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d export_marts --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG export_marts completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_enforcement" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_enforcement >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering fda_enforcement" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger fda_enforcement >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of fda_enforcement to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_enforcement --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_enforcement --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG fda_enforcement completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_excluded" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_excluded >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering fda_excluded" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger fda_excluded >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of fda_excluded to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_excluded --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_excluded --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG fda_excluded completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_ndc" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_ndc >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering fda_ndc" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger fda_ndc >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of fda_ndc to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_ndc --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_ndc --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG fda_ndc completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_unfinished" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_unfinished >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering fda_unfinished" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger fda_unfinished >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of fda_unfinished to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_unfinished --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_unfinished --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG fda_unfinished completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_unii" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_unii >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering fda_unii" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger fda_unii >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of fda_unii to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_unii --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_unii --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG fda_unii completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing mccpd" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause mccpd >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering mccpd" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger mccpd >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of mccpd to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d mccpd --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d mccpd --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG mccpd completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing nadac" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause nadac >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering nadac" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger nadac >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of nadac to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d nadac --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d nadac --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG nadac completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing orange_book" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause orange_book >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering orange_book" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger orange_book >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of orange_book to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d orange_book --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d orange_book --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG orange_book completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing purple_book" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause purple_book >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering purple_book" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger purple_book >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of purple_book to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d purple_book --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d purple_book --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG purple_book completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing rxclass" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause rxclass >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering rxclass" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger rxclass >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of rxclass to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d rxclass --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d rxclass --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG rxclass completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing rxnorm" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause rxnorm >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering rxnorm" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger rxnorm >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of rxnorm to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d rxnorm --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d rxnorm --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG rxnorm completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing rxnorm_historical" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause rxnorm_historical >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering rxnorm_historical" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger rxnorm_historical >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of rxnorm_historical to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d rxnorm_historical --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d rxnorm_historical --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG rxnorm_historical completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing rxterms" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause rxterms >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering rxterms" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger rxterms >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of rxterms to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d rxterms --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d rxterms --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG rxterms completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing umls" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause umls >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering umls" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger umls >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of umls to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d umls --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d umls --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG umls completed with status: $STATUS" | tee -a "$LOGFILE"

echo "[$(date)] 🔓 Unpausing vsac" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause vsac >> "$LOGFILE" 2>&1

echo "[$(date)] 🚀 Triggering vsac" | tee -a "$LOGFILE"
docker exec -i airflow-webserver airflow dags trigger vsac >> "$LOGFILE" 2>&1

echo "[$(date)] ⏳ Waiting for latest DAG run of vsac to finish..." | tee -a "$LOGFILE"
STATUS=""
LATEST_RUN=""
while [ -z "$LATEST_RUN" ]; do
    LATEST_RUN=$(docker exec -i airflow-webserver airflow dags list-runs -d vsac --no-color | grep manual__ | tail -n1 | awk '{print $1}')
    sleep 5
done

while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d vsac --no-color | grep "$LATEST_RUN" | awk '{print $6}')
    echo "   ➤ Status: $STATUS" | tee -a "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 20
done
echo "[$(date)] ✅ DAG vsac completed with status: $STATUS" | tee -a "$LOGFILE"

echo "=== All DAGs Completed at $(date) ===" | tee -a "$LOGFILE"