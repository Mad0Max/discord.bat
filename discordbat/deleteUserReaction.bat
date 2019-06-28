@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/messages/%msgid%/reactions/%emoji%/%user%" -method DELETE -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Deleted user reaction ^| Emoji %emoji% ^| User %user% ^| Message %msgid% >>output.log