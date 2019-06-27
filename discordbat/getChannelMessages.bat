@echo off
call ratelimitcheck.bat
if "%isratelimited%"=="1" timeout 5 >nul
if not defined limit set limit=50
call batchhttp.bat "https://discordapp.com/api/channels/%channel%/messages?limit=%limit%" -method GET -headers-file header.txt -saveTO response.txt
if %debug% equ true echo [%date% - %time%] Got messages ^| Channel %channel% ^| Limit %limit% >>output.log