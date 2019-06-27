@echo off
call ratelimitcheck.bat
if "%isratelimited%"=="1" timeout 5 >nul
set /a rolecolor=0x%rolecolor%
echo|set /p ="{"name":"%rolename%","permissions":%perms%,"color":%rolecolor%,"hoist":%hoist%,"mentionable":%mentionable%}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/guilds/%guild%/roles" -method POST -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Created role ^| Name: "%role%" ^| Permissions %perms% ^| Color %color% ^| Hoist %hoist% ^| Mentionable %mentionable% >>output.log