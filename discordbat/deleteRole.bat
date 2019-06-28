@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/guilds/%guild%/roles/%roleid%" -method DELETE -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Deleted role ^| Guild %guild% ^| Role %roleid% >>output.log