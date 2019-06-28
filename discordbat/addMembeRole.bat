@echo off
call ratelimitcheck.bat
call batchhttp.bat "https://discordapp.com/api/v6/guilds/%guild%/members/%user%/%role%" -method PUT -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Added role to user ^| Guild "%role%" ^| User %user% ^| Role %role% >>output.log