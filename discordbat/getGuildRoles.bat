@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/guilds/%guild%/roles" -method GET -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Got roles ^| Guild %guild% >>output.log