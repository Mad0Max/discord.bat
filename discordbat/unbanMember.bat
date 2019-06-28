@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/guilds/%guild%/bans/%user%" -method DELETE -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Unbanned user ^| Guild %guild% ^| User %user% >>output.log