title rag_top_down

ssh -tt rd@192.168.206.131 "tmux new -A -s rag 'cd ~/sagerx && docker compose up -d && for d in ashp atcddd build_marts cms_asp cms_hcpcs cms_hcris cms_ndc_hcpcs_crosswalk cms_part_d dailymed dailymed_pharm_class dailymed_rxnorm dailymed_zip_file_metadata dbt_gcp export_marts fda_enforcement fda_excluded fda_ndc fda_unfinished fda_unii mccpd nadac opais_340b orange_book purple_book quicksortx_umi rxclass rxnorm rxnorm_historical rxterms umls vsac; do echo [TRIGGER] $d; docker compose exec -T airflow-scheduler airflow dags trigger $d; done; echo DONE; exec bash'"
