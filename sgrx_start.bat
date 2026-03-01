REM wt vmrun start "D:\vm\Ubuntu-Server-24.04\clone-no-delete\C3\SageRX.vmx" nogui

"C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe" start "D:\vm\Ubuntu-Server-24.04\clone-no-delete\C3\SageRX.vmx" nogui

pause

@REM wt ssh rd@192.168.111.128 -t 'bash mnt.sh'

@REM wt ssh rd@192.168.111.128 -t "timeout 60 bash mnt.sh"


@REM wt ssh rd@192.168.111.128 -t "tmux new -s rag_za 'cd ~/sagerx && bash rag_z-a.sh'"


@REM wt ssh rd@192.168.111.128 -t "tmux new -s rag_v2 'cd ~/sagerx && bash run_dags_in_order_v2.sh'"
