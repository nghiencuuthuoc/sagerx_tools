@REM https://chatgpt.com/c/696af696-a854-8320-b76f-36f63c57f3e6

title ubuntu_reboot

@REM @echo off
@REM set "HOST=192.168.206.131"
@REM set "USER=rd"
@REM @REM ssh -tt %USER%@%HOST% "tmux new -d -s sys 'sudo /sbin/reboot' || tmux send-keys -t sys 'sudo /sbin/reboot' C-m"
@REM ssh -tt rd@192.168.206.131 "tmux new -d -s sys \"sudo shutdown -r +0 'Reboot requested from Windows'\""


@REM @echo off
@REM set "HOST=192.168.206.131"
@REM set "USER=rd"
@REM set "SESSION=sys"
@REM ssh -tt %USER%@%HOST% "tmux has-session -t %SESSION% 2>/dev/null && tmux send-keys -t %SESSION% 'sudo /sbin/reboot' C-m || tmux new -d -s %SESSION% 'sudo /sbin/reboot'"


@REM ssh -tt rd@192.168.206.131 "tmux kill-session -t sys 2>/dev/null; tmux new -d -s sys 'sudo /sbin/reboot'"



@echo off
set "HOST=192.168.206.131"
set "USER=rd"
set "SESSION=sys"
ssh -tt %USER%@%HOST% "tmux has-session -t %SESSION% 2>/dev/null && tmux send-keys -t %SESSION% 'sudo -n /sbin/reboot' C-m || tmux new -d -s %SESSION% 'sudo -n /sbin/reboot'"


pause
cls

ubuntu_reboot.bat