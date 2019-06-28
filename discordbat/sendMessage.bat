@echo off   
call ratelimitcheck.bat
echo|set /p ="{"content":"%msg%"}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/messages" -method POST -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Sent message ^| Content "%msg%" ^| Channel %channel% >>output.log