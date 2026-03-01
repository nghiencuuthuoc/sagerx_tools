ssh rd@192.168.111.128 "tmux new -d -s pgbackup 'cd ~/E/sagerx-backup && bash -i backup_pg.sh | tee backup_$(date +%Y%m%d_%H%M).log'"
