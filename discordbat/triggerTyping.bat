@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/typing" -method POST -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Triggered typing ^| Channel %channel% >>output.log