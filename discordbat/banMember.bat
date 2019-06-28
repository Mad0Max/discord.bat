@echo off
call ratelimitcheck.bat
echo|set /p ="{"delete-message-days":%dmd%,"reason":"%reason%"}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/guilds/%guild%/bans/%user%" -method PUT -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Banned user ^| User %user% ^| Guild %guild% ^| Reason "%reason%" ^| Deleted %dmd% message days >>output.log