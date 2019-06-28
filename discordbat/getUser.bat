@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/users/%user%" -method GET -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Got user ^| User %user% >>output.log