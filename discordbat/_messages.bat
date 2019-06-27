@echo off

set arg1=%~1
set arg2=%~2
set arg3=%~3
set arg4=%~4
set arg5=%~5
set arg6=%~6
set arg7=%~7
set arg8=%~8
set arg9=%~9

REM ========================================================================================
REM THIS IS NEEDED. REMOVING THIS GIVES USERS ACCESS TO YOUR SYTEM VARIABLES. DO NOT REMOVE.
REM ========================================================================================

echo %arg1%%arg2%%arg3%%arg4%%arg5%%arg6%%arg7%%arg8%%arg9% > security.txt
REM These characters will cause issues. Blocking them might be a good idea, even when things will be even more limited
findstr "%% ! > < >> << ^" security.txt 
if %errorlevel%==0 (
echo An attempt was made to access a forbidden character. This has been blocked.
) else (
if %debug% equ true (
echo %arg1% - %arg2% - %arg3% - %arg4% - %arg5% - %arg6% - %arg7% - %arg8% - %arg9%
set command=%arg1%
)
call bot.bat
)

REM ========================================================================================
REM THIS IS NEEDED. REMOVING THIS GIVES USERS ACCESS TO YOUR SYSTEM VARIABLES. DO NOT REMOVE.
REM ========================================================================================    