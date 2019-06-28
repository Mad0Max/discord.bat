@echo off
if not defined days set days=3
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/guilds/%guild%/prune?days=%days%" -method GET -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Got prune count ^| Guild %guild% ^| Days %days% >>output.log