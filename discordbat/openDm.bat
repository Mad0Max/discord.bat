@echo off
call ratelimitcheck.bat
echo|set /p ="{"recipient_id":"%user%"}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/users/@me/channels" -method POST -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Opened DM ^| Recipient %user% >>output.log