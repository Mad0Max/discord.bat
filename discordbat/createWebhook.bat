@echo off
call ratelimitcheck.bat
if "%isratelimited%"=="1" timeout 5 >nul
echo|set /p ="{"name":"%name%"}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/webhooks" -method POST -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Created webhook ^| Name: "%name%" >>output.log