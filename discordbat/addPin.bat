@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/pins/%msgid%" -method PUT -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Added pin ^| Channel %channel% ^| Message %msgid% >>output.log