@echo off
call ratelimitcheck.bat
echo|set /p ="{"max_age":%age%,"max_uses":"%uses%","temporary":"%temporary%","unique":"%unique%"}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/invites" -method POST -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Created invite ^| Channel %channel% ^| Max age %max_age% ^| Max uses %max_uses% ^| Is temporary %temporary% ^| Is unique %unique% >>output.log