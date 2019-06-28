@echo off
call ratelimitcheck.bat
set /a color=0x%color%
echo|set /p ="{"content":"%msg%","embed":{"title":"%title%","description":"%description%","color":%color%,"footer":{"text":"%footer%"}}}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/messages" -method POST -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Sent embed ^| Content: %msg% ^| Title: %title% ^| Description: %description% ^| Color: %color% ^| Footer: %footer% >>output.log