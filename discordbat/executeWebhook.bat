@echo off
call ratelimitcheck.bat
if "%isratelimited%"=="1" timeout 5 >nul
echo|set /p ="{"content":"%msg%"}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/webhooks/%webhook%/%webhooktoken%" -method POST -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Executed webhook ^| Content: "%msg%" >>output.log