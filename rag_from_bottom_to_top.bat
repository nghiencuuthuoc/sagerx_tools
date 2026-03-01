
title rag_from_bottom_to_top

ssh -tt rd@192.168.206.131 "tmux new -A -s rag 'cd ~/sagerx && docker compose up -d && for d in vsac umls rxterms rxnorm_historical rxnorm rxclass quicksortx_umi purple_book orange_book opais_340b nadac mccpd fda_unii fda_unfinished fda_ndc fda_excluded fda_enforcement export_marts dbt_gcp dailymed_zip_file_metadata dailymed_rxnorm dailymed_pharm_class dailymed cms_part_d cms_ndc_hcpcs_crosswalk cms_hcris cms_hcpcs cms_asp build_marts atcddd ashp; do echo [TRIGGER] $d; docker compose exec -T airflow-scheduler airflow dags trigger $d; done; echo DONE; exec bash'"



rag_from_bottom_to_top.bat
