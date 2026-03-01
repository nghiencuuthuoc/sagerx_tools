#!/bin/bash

LOGFILE="dag_run_ordered_log.txt"
echo "=== DAG Sequential Runner Started at $(date) ===" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing ashp" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause ashp >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering ashp" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger ashp | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d ashp | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing build_marts" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause build_marts >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering build_marts" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger build_marts | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d build_marts | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing cms_part_d" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause cms_part_d >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering cms_part_d" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger cms_part_d | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d cms_part_d | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dailymed" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dailymed >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering dailymed" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger dailymed | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dailymed_pharm_class" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dailymed_pharm_class >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering dailymed_pharm_class" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger dailymed_pharm_class | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed_pharm_class | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dailymed_rxnorm" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dailymed_rxnorm >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering dailymed_rxnorm" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger dailymed_rxnorm | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed_rxnorm | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dailymed_zip_file_metadata" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dailymed_zip_file_metadata >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering dailymed_zip_file_metadata" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger dailymed_zip_file_metadata | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dailymed_zip_file_metadata | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing dbt_gcp" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause dbt_gcp >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering dbt_gcp" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger dbt_gcp | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d dbt_gcp | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing export_marts" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause export_marts >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering export_marts" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger export_marts | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d export_marts | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_enforcement" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_enforcement >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering fda_enforcement" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger fda_enforcement | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_enforcement | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_excluded" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_excluded >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering fda_excluded" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger fda_excluded | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_excluded | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_ndc" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_ndc >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering fda_ndc" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger fda_ndc | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_ndc | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_unfinished" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_unfinished >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering fda_unfinished" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger fda_unfinished | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_unfinished | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing fda_unii" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause fda_unii >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering fda_unii" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger fda_unii | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d fda_unii | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing mccpd" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause mccpd >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering mccpd" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger mccpd | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d mccpd | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing nadac" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause nadac >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering nadac" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger nadac | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d nadac | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing orange_book" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause orange_book >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering orange_book" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger orange_book | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d orange_book | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing purple_book" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause purple_book >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering purple_book" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger purple_book | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d purple_book | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing rxclass" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause rxclass >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering rxclass" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger rxclass | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d rxclass | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing rxnorm" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause rxnorm >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering rxnorm" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger rxnorm | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d rxnorm | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing rxnorm_historical" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause rxnorm_historical >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering rxnorm_historical" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger rxnorm_historical | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d rxnorm_historical | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing rxterms" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause rxterms >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering rxterms" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger rxterms | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d rxterms | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing umls" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause umls >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering umls" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger umls | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d umls | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "[$(date)] 🔓 Unpausing vsac" >> "$LOGFILE"
docker exec -i airflow-webserver airflow dags unpause vsac >> "$LOGFILE" 2>&1
echo "[$(date)] 🚀 Triggering vsac" >> "$LOGFILE"
RUN_ID=$(docker exec -i airflow-webserver airflow dags trigger vsac | grep 'Created' | awk '{print $NF}' | tr -d '\r')
STATUS=""
while true; do
    STATUS=$(docker exec -i airflow-webserver airflow dags list-runs -d vsac | grep "$RUN_ID" | awk '{print $6}' | tr -d '\r')
    echo "   ➤ $dag status: $STATUS" >> "$LOGFILE"
    if [[ "$STATUS" == "success" || "$STATUS" == "failed" || "$STATUS" == "upstream_failed" ]]; then
        break
    fi
    sleep 10
done
echo "[$(date)] ✅ $dag completed with status: $STATUS" >> "$LOGFILE"

echo "=== All DAGs Completed at $(date) ===" >> "$LOGFILE"