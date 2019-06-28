@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/guilds/%guild%/audit-logs" -method GET -headers-file header.txt -saveTO audit-logs-%guild%.txt
if %debug% equ true echo [%date% - %time%] Got audit logs ^| Guild %guild% >>output.log