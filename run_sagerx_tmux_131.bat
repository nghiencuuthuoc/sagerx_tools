
@REM https://chatgpt.com/c/696af696-a854-8320-b76f-36f63c57f3e6

title run_sagerx_tmux_131 

ssh -tt rd@192.168.206.131 "tmux new -A -s sagerx 'cd ~/sagerx && docker compose up'"


@REM @echo off
@REM set "HOST=192.168.206.131"
@REM set "USER=rd"
@REM set "SESSION=sagerx"
@REM set "PROJ=~/sagerx"

@REM ssh -tt %USER%@%HOST% "tmux new -A -s %SESSION% 'cd %PROJ% && docker compose up'"


run_sagerx_tmux_131.bat

