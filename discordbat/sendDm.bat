@echo off
call ratelimitcheck.bat
echo|set /p ="{"content":"%msg%"}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/channels/%dmid%/messages" -method POST -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Sent DM ^| Content "%msg%" ^| DM Channel %dmid% >>output.log