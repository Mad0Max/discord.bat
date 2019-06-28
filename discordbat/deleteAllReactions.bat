@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/messages/%msgid%/reactions" -method DELETE -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Deleted all reactions ^| Message %msgid% >>output.log