@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/messages/%msgid%" -method GET -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Got message ^| Message %msgid% ^| Channel %channel% >>output.log