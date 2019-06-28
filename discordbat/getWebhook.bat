@echo off
call ratelimitcheck.bat
if "%isratelimited%"=="1" timeout 5 >nul
call batchhttp.bat "https://discordapp.com/api/v6/webhooks/%webhook%" -method GET -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Got webhook ^| ID: "%webhook%" >>output.log