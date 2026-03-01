
title ubuntu_poweroff
@REM @echo off
@REM set "HOST=192.168.206.131"
@REM set "USER=rd"
@REM @REM ssh -tt %USER%@%HOST% "tmux new -d -s sys 'sudo /sbin/poweroff' || tmux send-keys -t sys 'sudo /sbin/poweroff' C-m"

@REM ssh -tt rd@192.168.206.131 "tmux new -d -s sys \"sudo shutdown -h +0 'Poweroff requested from Windows'\""



@echo off
set "HOST=192.168.206.131"
set "USER=rd"
set "SESSION=sys"
ssh -tt %USER%@%HOST% "tmux has-session -t %SESSION% 2>/dev/null && tmux send-keys -t %SESSION% 'sudo -n /sbin/poweroff' C-m || tmux new -d -s %SESSION% 'sudo -n /sbin/poweroff'"


pause
cls
ubuntu_poweroff.bat